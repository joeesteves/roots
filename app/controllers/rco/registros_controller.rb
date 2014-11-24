class Rco::RegistrosController < ApplicationController
  before_action :set_rco_registro, only: [:show, :edit, :update, :destroy]
  
  # GET /rco/registros
  def index
    @desde = params[:desde]
    @hasta = params[:hasta]
    @cuentas = params[:cuentas]
    if request.format == 'application/json'
      @rco_registros = Rco::Registro.filtros(session[:empresa_id],
        params[:desde],params[:hasta],params[:cuentas])
    end
    
  end

  # GET /rco/registros/1
  def show
  end

  # GET /rco/registros/new
  def new
    @rco_registro = Rco::Registro.new
    define_nodo(params[:nodo])
  end

  # GET /rco/registros/1/edit
  def edit
  end

  # POST /rco/registros
  def create
    @rco_registro = Rco::Registro.new(rco_registro_params)

    if @rco_registro.save
      redirect_to rco_registros_path, notice: 'Registro guardado.'
      ubica_en_nodo(params[:nodo])
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /rco/registros/1
  def update
    if @rco_registro.update(rco_registro_params)
      redirect_to rco_registros_path, notice: 'Registro actualizado.'
    else
      render action: 'edit'
    end
  end

  # DELETE /rco/registros/1
  # def destroy
  #   @rco_registro.destroy
  #   redirect_to rco_registros_url, notice: 'Registro eliminado.'
  # end

  def borrar_seleccion
    Rco::Registro.destroy(params[:ids]) 
    render nothing: true  
  end

  # def buscarCompatibles(action)
  #   if action == "new"
  #     Rco::Registro.compatiblesXCta(cuenta_id, saldoTipo)
  #   else
       
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rco_registro
      @rco_registro = Rco::Registro.find(params[:id])
    end



    # Only allow a trusted parameter "white list" through.
    def rco_registro_params
      params.require(:rco_registro).permit(:fecha, :asiento_id, :cuenta_id, :debe, :haber, :vencimiento, :desc)
    end
end
