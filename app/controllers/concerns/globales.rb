module Globales
	extend ActiveSupport::Concern

	def getVariables(controller_path)
    controller = controller_path.gsub('/','_')
    coleccion = '@' + controller 
    member = coleccion.singularize
    metodo_ids = (controller.singularize + '_ids').to_sym
    metodo = controller.to_sym
    clase = controller_path.singularize.classify.constantize
    return {controller: controller, coleccion: coleccion, member: member, 
      metodo_ids: metodo_ids, metodo: metodo, clase: clase}
  end

  def arbol_index(nodo)
    v = getVariables(controller_path)
    if nodo
      unless nodo == 'raiz' 
       instance_variable_set(v[:coleccion], Rba::Nodo.find(nodo).send(v[:metodo]))
      else    
       instance_variable_set(v[:coleccion], Rba::Arbol.find_by_modelo(controller_path).nodos.first.send(v[:metodo]))
      end
    else  
     instance_variable_set(v[:coleccion],v[:clase].all)
    end
	end


  def editar_multiples
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
    # @rba_empresas = Rba::Empresa.update(params[:rba_empresas].keys, params[:rba_empresas].values)
    # @rba_empresas.reject! { |p| p.errors.empty? }
    if @coleccion.empty?
      redirect_to action: :index
    else
      render "editar_multiples"
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
    unless nodo == 'undefined'
      v = getVariables(controller_path)
      Rba::Nodo.find(nodo).send(v[:metodo]) << instance_variable_get(v[:member])
    end
  end


end
