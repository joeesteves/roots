class Rba::LoteutilizacionesController < ApplicationController
  before_action :set_rba_loteutilizacion, only: [:show, :edit, :update, :destroy]
  
  # GET /rba/loteutilizaciones
  def index
    arbol_index(params[:nodo], flash_nodo: flash[:nodo], includes: [:lote, :campana, :actividad])
  end

  # GET /rba/loteutilizaciones/1
  def show
  end

  # GET /rba/loteutilizaciones/new
  def new
    @rba_loteutilizacion = Rba::Loteutilizacion.new
    define_nodo(params[:nodo])
  end

  # GET /rba/loteutilizaciones/1/edit
  def edit
  end

  # POST /rba/loteutilizaciones
  def create
    @rba_loteutilizacion = Rba::Loteutilizacion.new(rba_loteutilizacion_params)

    if @rba_loteutilizacion.save
      redirect_to rba_loteutilizaciones_path, notice: 'Loteutilizacion guardado.'
      ubica_en_nodo(params[:nodo])
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /rba/loteutilizaciones/1
  def update
    if @rba_loteutilizacion.update(rba_loteutilizacion_params)
      flash[:nodo] = @rba_loteutilizacion.nodos.first.id rescue nil
      redirect_to rba_loteutilizaciones_path, notice: 'Loteutilizacion actualizado.'
    else
      render action: 'edit'
    end
  end

  # DELETE /rba/loteutilizaciones/1
  def destroy
    @rba_loteutilizacion.destroy
    redirect_to rba_loteutilizaciones_url, notice: 'Loteutilizacion eliminado.'
  end

  def borrar_seleccion
    Rba::Loteutilizacion.destroy(params[:ids]) 
    render nothing: true  
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rba_loteutilizacion
      @rba_loteutilizacion = Rba::Loteutilizacion.find(params[:id])
    end



    # Only allow a trusted parameter "white list" through.
    def rba_loteutilizacion_params
      params.require(:rba_loteutilizacion).permit(:estado, :codigo, :nombre, :desc, :lote_id, :campana_id, :actividad_id, :superficie)
    end
end
