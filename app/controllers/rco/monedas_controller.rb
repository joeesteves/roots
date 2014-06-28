class Rco::MonedasController < ApplicationController
  before_action :set_rco_moneda, only: [:show, :edit, :update, :destroy]
  
  # GET /rco/monedas
  def index
    arbol_index(params[:nodo])
  end

  # GET /rco/monedas/1
  def show
  end

  # GET /rco/monedas/new
  def new
    @rco_moneda = Rco::Moneda.new
    define_nodo(params[:nodo])
  end

  # GET /rco/monedas/1/edit
  def edit
  end

  # POST /rco/monedas
  def create
    @rco_moneda = Rco::Moneda.new(rco_moneda_params)

    if @rco_moneda.save
      redirect_to rco_monedas_path, notice: 'Moneda guardado.'
      ubica_en_nodo(params[:nodo])
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /rco/monedas/1
  def update
    if @rco_moneda.update(rco_moneda_params)
      redirect_to rco_monedas_path, notice: 'Moneda actualizado.'
    else
      render action: 'edit'
    end
  end

  # DELETE /rco/monedas/1
  def destroy
    @rco_moneda.destroy
    redirect_to rco_monedas_url, notice: 'Moneda eliminado.'
  end

  def borrar_seleccion
    Rco::Moneda.destroy(params[:ids]) 
    render nothing: true  
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rco_moneda
      @rco_moneda = Rco::Moneda.find(params[:id])
    end



    # Only allow a trusted parameter "white list" through.
    def rco_moneda_params
      params.require(:rco_moneda).permit(:codigo, :nombre)
    end
end
