class Rba::NodosController < ApplicationController
  before_action :set_rba_nodo, only: [:show, :edit, :update, :destroy]
  
  # GET /rba/nodos
  def index
    unless params[:modelo]
      @rba_nodos = Rba::Nodo.all
    else  
      @rba_nodos = Rba::Arbol.find_by_modelo(params[:modelo]).nodos
       #.where.not(:padre_id => 'null' )
    end
  end

  # GET /rba/nodos/1
  def show
  end

  # GET /rba/nodos/new
  def new
    @rba_nodo = Rba::Nodo.new
  end

  # GET /rba/nodos/1/edit
  def edit
  end

  # POST /rba/nodos
  def create
    @rba_nodo = Rba::Nodo.new(rba_nodo_params)

    if @rba_nodo.save
      redirect_to rba_nodos_path, notice: 'Nodo guardado.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /rba/nodos/1
  def update
    if @rba_nodo.id == params[:rba_nodo][:padre_id].to_i
      params[:rba_nodo][:padre_id] = nil 
    end

    if params[:es_drop] == 'true' 
        @rba_nodo.update(rba_nodo_params)
        render :nothing => true  #se actualiza con el drag and drop en el abm
    elsif  @rba_nodo.update(rba_nodo_params)
        
      redirect_to rba_nodos_path, notice: 'Nodo actualizado.'
    else
      render action: 'edit'
    end
  end

  # DELETE /rba/nodos/1
  def destroy
    @rba_nodo.destroy
    redirect_to rba_nodos_url, notice: 'Nodo eliminado.'
  end

  def borrar_seleccion
    unless Rba::Nodo.has_items(params[:ids])
      Rba::Nodo.destroy(params[:ids]) 
      render nothing: true
    else
      render nothing: true
    end  
  end
 
  def mover_items
    # Los modelos-items deben tener la relacion habtm declarada 

    # metodo definido en Globales pasamos el controller_path del modelo en el cual
    # estamos trabajando. Lo hace el ajax $.fn.pegar en fxacciones.

    v = getVariables(params[:controller_path])

    arbol = Rba::Arbol.find_by_modelo(params[:controller_path])
    nodo_destino = Rba::Nodo.find(params[:nodo])
    items_destino_prev = nodo_destino.send(v[:metodo]).collect(&:id)
    items_seleccion = params[:items].split(',').map(&:to_i)
    items_destino_total = items_destino_prev + items_seleccion

    # identifica el nodo utilizando el primer item del array.
    begin 
      nodo_origen =  v[:clase].find(items_seleccion[0]).nodos.
      where(:arbol_id => arbol.id).first
    rescue
      nodo_origen = nil
    end


    unless nodo_origen == nodo_destino
      unless nodo_origen.nil? 
        items_origen_prev = nodo_origen.send(v[:metodo]).collect(&:id)
        items_origen_total = items_origen_prev - items_seleccion
        nodo_origen.update_attributes(v[:metodo_ids] => items_origen_total) 
      end     
      nodo_destino.update_attributes(v[:metodo_ids] => items_destino_total)
    end
  
    render nothing: true  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rba_nodo
      @rba_nodo = Rba::Nodo.find(params[:id])
    end



    # Only allow a trusted parameter "white list" through.
    def rba_nodo_params
      params.require(:rba_nodo).permit(:nombre, :arbol_id, :padre_id, :modelo)
    end
end
