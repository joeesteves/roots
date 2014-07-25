class Rga::EventosController < ApplicationController
  before_action :set_rga_evento, only: [:show, :edit, :update, :destroy]
  
  # GET /rga/eventos
  def index
    arbol_index(params[:nodo], flash_nodo: flash[:nodo], includes: [:eventotipo])
  end

  # GET /rga/eventos/1
  def show
  end

  # GET /rga/eventos/new
  def new
    @rga_evento = Rga::Evento.new
    define_nodo(params[:nodo])
  end

  # GET /rga/eventos/1/edit
  def edit
    @eventoTipoCodigo = @rga_evento.eventotipo.codigo
  end

  # POST /rga/eventos
  def create
    @rga_evento = Rga::Evento.new(rga_evento_params)

    if @rga_evento.save
      actualizar_estados(@rga_evento, params[:rga_evento][:origestado_ids], params[:rga_evento][:destestado_ids])
      redirect_to rga_eventos_path, notice: 'Evento guardado.'
      ubica_en_nodo(params[:nodo])
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /rga/eventos/1
  def update
    if @rga_evento.update(rga_evento_params)
      actualizar_estados(@rga_evento, params[:rga_evento][:origestado_ids], params[:rga_evento][:destestado_ids])
      flash[:nodo] = @rga_evento.nodos.first.id rescue nil
      redirect_to rga_eventos_path, notice: 'Evento actualizado.'
    else
      render action: 'edit'
    end
  end

  # DELETE /rga/eventos/1
  def destroy
    @rga_evento.destroy
    redirect_to rga_eventos_url, notice: 'Evento eliminado.'
  end

  def borrar_seleccion
    Rga::Evento.destroy(params[:ids]) 
    render nothing: true  
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rga_evento
      @rga_evento = Rga::Evento.find(params[:id])
    end

  def actualizar_estados(rga_evento, origestados, destestados)
    comunestados = origestados & destestados
    origestados -= comunestados
    destestados -= comunestados

    todos = comunestados + origestados + destestados
    rga_evento.update_attributes(:estado_ids => todos)
    unless origestados.empty?
      rga_evento.estados_eventos.where(:estado_id => origestados).each do |o|
        o.update_attributes(:codigo => 'O')
      end
    end
    unless destestados.empty?
      rga_evento.estados_eventos.where(:estado_id => destestados).each do |o|
        o.update_attributes(:codigo => 'D')
      end
    end
    unless comunestados.empty?
      rga_evento.estados_eventos.where(:estado_id => comunestados).each do |o|
        o.update_attributes(:codigo => 'OD')
      end
    end
  end

    # Only allow a trusted parameter "white list" through.
    def rga_evento_params
      params.require(:rga_evento).permit(:estado, :codigo, :nombre, :desc, :eventotipo_id, :estado_ids)
    end
end
