class Rco::CuentatiposController < ApplicationController
  before_action :set_rco_cuentatipo, only: [:show, :edit, :update, :destroy]
  
  # GET /rco/cuentatipos
  def index
    arbol_index(params[:nodo])
  end

  # GET /rco/cuentatipos/1
  def show
  end

  # GET /rco/cuentatipos/new
  def new
    @rco_cuentatipo = Rco::Cuentatipo.new
    define_nodo(params[:nodo])
  end

  # GET /rco/cuentatipos/1/edit
  def edit
  end

  # POST /rco/cuentatipos
  def create
    @rco_cuentatipo = Rco::Cuentatipo.new(rco_cuentatipo_params)

    if @rco_cuentatipo.save
      redirect_to rco_cuentatipos_path, notice: 'Cuentatipo guardado.'
      ubica_en_nodo(params[:nodo])
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /rco/cuentatipos/1
  def update
    if @rco_cuentatipo.update(rco_cuentatipo_params)
      redirect_to rco_cuentatipos_path, notice: 'Cuentatipo actualizado.'
    else
      render action: 'edit'
    end
  end

  # DELETE /rco/cuentatipos/1
  def destroy
    @rco_cuentatipo.destroy
    redirect_to rco_cuentatipos_url, notice: 'Cuentatipo eliminado.'
  end

  def borrar_seleccion
    Rco::Cuentatipo.destroy(params[:ids]) 
    render nothing: true  
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rco_cuentatipo
      @rco_cuentatipo = Rco::Cuentatipo.find(params[:id])
    end



    # Only allow a trusted parameter "white list" through.
    def rco_cuentatipo_params
      params.require(:rco_cuentatipo).permit(:codigo, :nombre, :estado, :desc)
    end
end
