class Rga::EstadosController < ApplicationController
  before_action :set_rga_estado, only: [:show, :edit, :update, :destroy]
  
  # GET /rga/estados
  def index
    arbol_index(params[:nodo], flash_nodo: flash[:nodo])
  end

  # GET /rga/estados/1
  def show
  end

  # GET /rga/estados/new
  def new
    @rga_estado = Rga::Estado.new
    define_nodo(params[:nodo])
  end

  # GET /rga/estados/1/edit
  def edit
  end

  # POST /rga/estados
  def create
    @rga_estado = Rga::Estado.new(rga_estado_params)

    if @rga_estado.save
      redirect_to rga_estados_path, notice: 'Estado guardado.'
      ubica_en_nodo(params[:nodo])
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /rga/estados/1
  def update
    if @rga_estado.update(rga_estado_params)
      flash[:nodo] = @rga_estado.nodos.first.id rescue nil
      redirect_to rga_estados_path, notice: 'Estado actualizado.'
    else
      render action: 'edit'
    end
  end

  # DELETE /rga/estados/1
  def destroy
    @rga_estado.destroy
    redirect_to rga_estados_url, notice: 'Estado eliminado.'
  end

  def borrar_seleccion
    Rga::Estado.destroy(params[:ids]) 
    render nothing: true  
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rga_estado
      @rga_estado = Rga::Estado.find(params[:id])
    end



    # Only allow a trusted parameter "white list" through.
    def rga_estado_params
      params.require(:rga_estado).permit(:estado, :codigo, :nombre, :desc)
    end
end
