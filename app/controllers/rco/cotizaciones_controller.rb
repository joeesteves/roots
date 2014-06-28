class Rco::CotizacionesController < ApplicationController
  before_action :set_rco_cotizacion, only: [:show, :edit, :update, :destroy]
  
  # GET /rco/cotizaciones
  def index
    arbol_index(params[:nodo])
  end

  # GET /rco/cotizaciones/1
  def show
  end

  # GET /rco/cotizaciones/new
  def new
    @rco_cotizacion = Rco::Cotizacion.new
    define_nodo(params[:nodo])
  end

  # GET /rco/cotizaciones/1/edit
  def edit
  end

  # POST /rco/cotizaciones
  def create
    @rco_cotizacion = Rco::Cotizacion.new(rco_cotizacion_params)

    if @rco_cotizacion.save
      redirect_to rco_cotizaciones_path, notice: 'Cotizacion guardado.'
      ubica_en_nodo(params[:nodo])
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /rco/cotizaciones/1
  def update
    if @rco_cotizacion.update(rco_cotizacion_params)
      redirect_to rco_cotizaciones_path, notice: 'Cotizacion actualizado.'
    else
      render action: 'edit'
    end
  end

  # DELETE /rco/cotizaciones/1
  def destroy
    @rco_cotizacion.destroy
    redirect_to rco_cotizaciones_url, notice: 'Cotizacion eliminado.'
  end

  def borrar_seleccion
    Rco::Cotizacion.destroy(params[:ids]) 
    render nothing: true  
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rco_cotizacion
      @rco_cotizacion = Rco::Cotizacion.find(params[:id])
    end



    # Only allow a trusted parameter "white list" through.
    def rco_cotizacion_params
      params.require(:rco_cotizacion).permit(:fecha, :cotizacion, :moneda_id)
    end
end
