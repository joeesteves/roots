class Rba::NodosController < ApplicationController
  before_action :set_rba_nodo, only: [:show, :edit, :update, :destroy]

  # GET /rba/nodos
  def index

    unless params[:modelo]
      @rba_nodos = Rba::Nodo.all
    else  
      @rba_nodos = Rba::Arbol.find_by_modelo(params[:modelo]).nodos #.where.not(:padre_id => 'null' )
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
    
    @rba_nodo.update(rba_nodo_params)
    render :nothing => true # se actualiza con el drag and drop en el abm
    #   #redirect_to rba_nodos_path, notice: 'Nodo actualizado.'
      
    # else
    #   render action: 'edit'
    # end
  end

  # DELETE /rba/nodos/1
  def destroy
    @rba_nodo.destroy
    redirect_to rba_nodos_url, notice: 'Nodo eliminado.'
  end

  def borrar_seleccion
    Rba::Nodo.delete(params[:ids]) 
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
