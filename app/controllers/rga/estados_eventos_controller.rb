class Rga::EstadosEventosController < ApplicationController
  before_action :set_rga_estados_evento, only: [:show, :edit, :update, :destroy]
  
  # GET /rga/estados_eventos
  def index
    arbol_index(params[:nodo], flash_nodo: flash[:nodo])
  end

  # GET /rga/estados_eventos/1
  def show
  end

  # GET /rga/estados_eventos/new
  def new
    @rga_estados_evento = Rga::EstadosEvento.new
    define_nodo(params[:nodo])
  end

  # GET /rga/estados_eventos/1/edit
  def edit
  end

  # POST /rga/estados_eventos
  def create
    @rga_estados_evento = Rga::EstadosEvento.new(rga_estados_evento_params)

    if @rga_estados_evento.save
      redirect_to rga_estados_eventos_path, notice: 'Estados evento guardado.'
      ubica_en_nodo(params[:nodo])
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /rga/estados_eventos/1
  def update
    if @rga_estados_evento.update(rga_estados_evento_params)
      flash[:nodo] = @rga_estados_evento.nodos.first.id rescue nil
      redirect_to rga_estados_eventos_path, notice: 'Estados evento actualizado.'
    else
      render action: 'edit'
    end
  end

  # DELETE /rga/estados_eventos/1
  def destroy
    @rga_estados_evento.destroy
    redirect_to rga_estados_eventos_url, notice: 'Estados evento eliminado.'
  end

  def borrar_seleccion
    Rga::EstadosEvento.destroy(params[:ids]) 
    render nothing: true  
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rga_estados_evento
      @rga_estados_evento = Rga::EstadosEvento.find(params[:id])
    end



    # Only allow a trusted parameter "white list" through.
    def rga_estados_evento_params
      params.require(:rga_estados_evento).permit(:codigo, :estado_id, :evento_id)
    end
end
