class Rco::AsientosController < ApplicationController
  before_action :set_rco_asiento, only: [:show, :edit, :update, :destroy]
  
  # GET /rco/asientos
  def index
    arbol_index(params[:nodo])
  end

  # GET /rco/asientos/1
  def show
  end

  # GET /rco/asientos/new
  def new
    @rco_asiento = Rco::Asiento.new
    define_nodo(params[:nodo])
  end

  # GET /rco/asientos/1/edit
  def edit
  end

  # POST /rco/asientos
  def create
    @rco_asiento = Rco::Asiento.new(rco_asiento_params)

    if @rco_asiento.save
      redirect_to rco_asientos_path, notice: 'Asiento guardado.'
      ubica_en_nodo(params[:nodo])
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /rco/asientos/1
  def update
    if @rco_asiento.update(rco_asiento_params)
      redirect_to rco_asientos_path, notice: 'Asiento actualizado.'
    else
      render action: 'edit'
    end
  end

  # DELETE /rco/asientos/1
  def destroy
    @rco_asiento.destroy
    redirect_to rco_asientos_url, notice: 'Asiento eliminado.'
  end

  def borrar_seleccion
    Rco::Asiento.destroy(params[:ids]) 
    render nothing: true  
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rco_asiento
      @rco_asiento = Rco::Asiento.find(params[:id])
    end



    # Only allow a trusted parameter "white list" through.
    def rco_asiento_params
      params.require(:rco_asiento).permit(:fecha, :moneda_id, :cotizacion, :desc)
    end
end
