module Globales
	extend ActiveSupport::Concern

	def getVariables(controller_path)
    controller = controller_path.gsub('/','_')
    coleccion = '@' + controller 
    member = coleccion.singularize
    metodo = controller.to_sym
    clase = controller_path.singularize.classify.constantize
    return {member: member, controller: controller, coleccion: coleccion, metodo: metodo, clase: clase}
  end

  def arbol_index(nodo)
    v = getVariables(controller_path)
    # modelo = '@' + controller_path.gsub('/','_')
    # metodo = controller_path.gsub('/','_').to_sym
    # clase = controller_path.singularize.classify.constantize
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
      @nodo = Rba::Arbol.find_by_modelo(controller_path).nodos.first.id
    end

  end  
  def ubica_en_nodo(nodo)
    v = getVariables(controller_path)
    Rba::Nodo.find(nodo).send(v[:metodo]) << instance_variable_get(v[:member])
  end


end
