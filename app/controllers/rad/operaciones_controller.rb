class Rad::OperacionesController < ApplicationController
  before_action :set_rad_operacion, only: [:show, :edit, :update, :destroy]
  
  # GET /rad/operaciones
  def index
    arbol_index(params[:nodo], { flash_nodo: flash[:nodo], includes: :operaciontipo})
  end

  # GET /rad/operaciones/1
  def show
  end

  # GET /rad/operaciones/new
  def new
    @compatibles = Rco::Registro.all

    @rad_operacion = Rad::Operacion.new
    @operacionCodigo = -1 # Se define por default el egreso (-1) que es la mas habitual
    @rad_operacion.operaciontipo_id = Rad::Operaciontipo.where(:codigo => @operacionCodigo).last.id
    @cuentas = Rco::Cuenta.xOperacionTipo(@operacionCodigo.to_s, session[:empresagrupo_id])
    define_nodo(params[:nodo])
    # @aplicaciones_dest = Rco: 
     
  end

  # GET /rad/operaciones/1/edit
  def edit
    @operacionCodigo = @rad_operacion.operaciontipo.codigo
    @cuentas = Rco::Cuenta.xOperacionTipo(@operacionCodigo.to_s, session[:empresagrupo_id])
    # utilizo first solo para probar
    @compatibles = @rad_operacion.registros.first().compatibles

  end

  # POST /rad/operaciones
  def create

    @rad_operacion = Rad::Operacion.new(rad_operacion_params)
    @rad_operacion.empresa_id = session[:empresa_id] 


    if @rad_operacion.rSave
      redirect_to rad_operaciones_path, notice: 'Operacion guardado.'
      ubica_en_nodo(params[:nodo])
    else

      @cuentas = Rco::Cuenta.xOperacionTipo(@rad_operacion.operaciontipo.codigo.to_s, session[:empresagrupo_id])
      render action: 'new'
    end
  end

  # PATCH/PUT /rad/operaciones/1
  def update
    if @rad_operacion.rUpdate(rad_operacion_params)
      flash[:nodo] = @rad_operacion.nodos.first.id rescue nil
      redirect_to rad_operaciones_path, notice: 'Operacion actualizado.'
    else
      render action: 'edit'
    end
  end

  # DELETE /rad/operaciones/1
  def destroy
    @rad_operacion.destroy
    redirect_to rad_operaciones_url, notice: 'Operacion eliminado.'
  end

  def borrar_seleccion
    Rad::Operacion.destroy(params[:ids]) 
    render nothing: true  
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rad_operacion
      @rad_operacion = Rad::Operacion.find(params[:id])
    end



    # Only allow a trusted parameter "white list" through.
    def rad_operacion_params
      params.require(:rad_operacion).permit(:fecha, :importe, :operaciontipo_id, :cuotas, 
        :cuotaimporte, :ctaD_id, :ctaH_id, :desc, :esgenerado, :empresa_id, :rdosxmes)
    end
end
