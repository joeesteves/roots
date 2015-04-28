module ControllerGlobales
	extend ActiveSupport::Concern

	def getVariables(controller_path)
    path = controller_path
    controller = controller_path.gsub('/','_')
    coleccion = '@' + controller 
    member = coleccion.singularize
    metodo_ids = (controller.singularize + '_ids').to_sym
    metodo = controller.to_sym
    clase = controller_path.singularize.classify.constantize
    entidad = path.split("/")[1]
    entidad_id = entidad.singularize + "_id"
    return {controller: controller, coleccion: coleccion, member: member, 
      metodo_ids: metodo_ids, metodo: metodo, clase: clase, path: path, entidad_id: entidad_id}
  end

  def arbol_index(nodo, args = {})
    #argumentos opcionales [:contexto] filtra por grupo o empresa 
    #argumentos opcionales [:includes] eager loading
    
    v = getVariables(controller_path)
    contexto = ""
    includes = ""
    if args[:includes]
      includes = args[:includes]
    end
    if args[:contexto]
      case args[:contexto]
      when "grupo"
        contexto = "empresagrupo_id = #{session[:empresagrupo_id]}"
      when "empresa"
        contexto = "empresa_id = #{session[:empresa_id]}"
      end
    end
    if args[:flash_nodo]
      @nodo = args[:flash_nodo]
    end
    if nodo
      unless nodo == 'raiz' # definido en grid_init
       instance_variable_set(v[:coleccion], Rba::Nodo.find(nodo).send(v[:metodo]).
        where(contexto).order(args[:order]))
      else    
       instance_variable_set(v[:coleccion], Rba::Arbol.
        find_by_modelo(controller_path).
        nodos.first.send(v[:metodo]).
        where(contexto).order(args[:order]))
      end
    else  
     instance_variable_set(v[:coleccion],v[:clase].
      where(contexto).includes(includes).order(args[:order]))
    end
  end


  def editar_multiples
    if params[:nodo]
      @nodo = params[:nodo]
    end
    v = getVariables(controller_path) # returns hash
    instance_variable_set(v[:coleccion], v[:clase].find(params[:items].split(',')))   
    respond_to do |format|
      format.html
    end 
  end

   def actualizar_multiples
    v = getVariables(controller_path)
    
    @coleccion = instance_variable_set(v[:coleccion], v[:clase].update(params[v[:metodo]].keys, params[v[:metodo]].values))
    @coleccion.reject! { |p| p.errors.empty? }
   
    if @coleccion.empty?
      flash[:nodo] = params[:nodo]
      redirect_to action: :index
    else
      render "editar_multiples"
    end
  end 

  def borrar_seleccion
    v = getVariables(controller_path)
    @coleccion = instance_variable_set(v[:coleccion], v[:clase].find(params[:ids]))
    @errores_array = []
    @coleccion.each do |member|
      member.destroy
      @errores_array += member.errors.to_a unless member.errors.blank? 
    end

    if @errores_array.empty?
      render nothing: true
    else
      respond_to do |format|
        format.js {render template: '/layouts/globals/_borrar_seleccion.js.erb'}
      end
    end
  end

  def define_nodo(nodo)
    if nodo
      @nodo = nodo
    else
      begin
        @nodo = Rba::Arbol.find_by_modelo(controller_path).nodos.first.id
      rescue
        @nodo = 'undefined'
      end
    end
  end  
  def ubica_en_nodo(nodo)
    unless nodo == 'undefined' || nodo == '/'
      v = getVariables(controller_path)
      Rba::Nodo.find(nodo).send(v[:metodo]) << instance_variable_get(v[:member])
      nodo = Rba::Nodo.find(nodo)
      flash[:nodo] = nodo.id
    end
  end


  def importar
    entidad = getVariables(controller_path)
    begin
      @rta = entidad[:clase].importar(params[:file],entidad, params[:empresa_id], params[:empresagrupo_id]) 
      unless @rta == false
        instance_variable_set(entidad[:member],@rta)
        render :new 
      else 
       redirect_to  root_path+controller_path, notice: "se han importado los items correctamente"
      end
    rescue Exception => e
      redirect_to  root_path+controller_path, notice: "Hubo algun Error! #{e}"
    end
  end
end
