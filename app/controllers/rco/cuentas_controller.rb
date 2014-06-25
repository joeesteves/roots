class Rco::CuentasController < ApplicationController
  before_action :set_rco_cuenta, only: [:show, :edit, :update, :destroy]
  include Globales
  
  # GET /rco/cuentas
  def index
    arbol_index(params[:nodo])
  end

  # GET /rco/cuentas/1
  def show
  end

  # GET /rco/cuentas/new
  def new
    @rco_cuenta = Rco::Cuenta.new
    define_nodo(params[:nodo])
  end

  def importar
    begin 
      Rco::Cuenta.importar(params[:file],controller_path)
      redirect_to  rco_cuentas_path, notice: "se han importado las cuentas correctamente"
    rescue Exception => e
      redirect_to  rco_cuentas_path, notice: "Hubo algun Error! #{e}"
    end
  end

  # GET /rco/cuentas/1/edit
  def edit
  end

  # POST /rco/cuentas
  def create
    @rco_cuenta = Rco::Cuenta.new(rco_cuenta_params)

    if @rco_cuenta.save
      redirect_to rco_cuentas_path, notice: 'Cuenta guardado.'
      ubica_en_nodo(params[:nodo])
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /rco/cuentas/1
  def update
    if @rco_cuenta.update(rco_cuenta_params)
      redirect_to rco_cuentas_path, notice: 'Cuenta actualizado.'
    else
      render action: 'edit'
    end
  end

  # DELETE /rco/cuentas/1
  def destroy
    @rco_cuenta.destroy
    redirect_to rco_cuentas_url, notice: 'Cuenta eliminado.'
  end

  def borrar_seleccion
    Rco::Cuenta.destroy(params[:ids]) 
    render nothing: true  
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rco_cuenta
      @rco_cuenta = Rco::Cuenta.find(params[:id])
    end



    # Only allow a trusted parameter "white list" through.
    def rco_cuenta_params
      params.require(:rco_cuenta).permit(:codigo, :nombre, 
        :estado, :desc, :cuentatipo_id, :empresagrupo_id)
    end
end
