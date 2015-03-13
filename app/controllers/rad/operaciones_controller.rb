class Rad::OperacionesController < ApplicationController
  before_action :set_rad_operacion, only: [:show, :edit, :update, :destroy]
  
  # GET /rad/operaciones
  def index
    arbol_index(params[:nodo], { flash_nodo: flash[:nodo], includes: :operaciontipo, contexto: "empresa"})
  end

  # GET /rad/operaciones/1
  def show
  end

  # GET /rad/operaciones/new
  def new

    @rad_operacion = Rad::Operacion.new
    @rad_operacion.operacionregistros.new(:saldotipo => 'debe')
    @rad_operacion.operacionregistros.new(:saldotipo => 'haber')
    @operacionCodigo = -1 # Se define por default el egreso (-1) que es la mas habitual
    @rad_operacion.operaciontipo_id = Rad::Operaciontipo.where(:codigo => @operacionCodigo).last.id
    @cuentas = Rco::Cuenta.xOperacionTipo(@operacionCodigo.to_s, session[:empresagrupo_id])
    define_nodo(params[:nodo])
    # @aplicaciones_dest = Rco: 
     
  end

  # GET /rad/operaciones/1/edit
  def edit
    @cuentas = Rco::Cuenta.xOperacionTipo(@rad_operacion.operaciontipo.codigo.to_s, session[:empresagrupo_id])
   
  end

  # POST /rad/operaciones
  def create

    @rad_operacion = Rad::Operacion.new(rad_operacion_params)
    @rad_operacion.empresa_id = session[:empresa_id]
    ahAplicaciones = params[:aplicaciones]
    if @rad_operacion.rSave(ahAplicaciones)
      redirect_to rad_operaciones_path, notice: 'Operacion guardado.'
      ubica_en_nodo(params[:nodo])
    else
      @cuentas = Rco::Cuenta.xOperacionTipo(@rad_operacion.operaciontipo.codigo.to_s, session[:empresagrupo_id])
      render action: 'new'
    end
  end

  # PATCH/PUT /rad/operaciones/1
  def update
    ahAplicaciones = params[:aplicaciones]
    if @rad_operacion.rUpdate(rad_operacion_params, ahAplicaciones)
      flash[:nodo] = @rad_operacion.nodos.first.id rescue nil
      redirect_to rad_operaciones_path, notice: 'Operacion actualizado.'
    else
     @cuentas = Rco::Cuenta.xOperacionTipo(@rad_operacion.operaciontipo.codigo.to_s, session[:empresagrupo_id])
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
 
 def compatibles
  aplicados_ids = []
  if params[:rad_operacion_id]
    operacion_id = params[:rad_operacion_id].to_i
    if (params[:saldoTipo] == "haber")
      regOri = Rad::Operacion.find(operacion_id).registros.alHaber.first
      compatibles = regOri.compatibles
      aplicados_ids = regOri.aplicados.collect(&:id)
    else
      regOri =  Rad::Operacion.find(operacion_id).registros.alDebe.first
      compatibles = regOri.compatibles
      aplicados_ids = regOri.aplicados.collect(&:id)
    end    
  else

    compatibles = Rco::Registro.compatiblesXOrganizacion(params[:cuenta_id], params[:saldoTipo])
  end
  compatibles = [] if compatibles.nil?

  @compatibles = Array.new
  compatibles.each do |reg|
    opcion = Hash.new
    opcion['id'] = reg.id.to_s
    opcion['desc'] = reg.desc
    opcion['fecha'] = reg.fecha.strftime("%d/%m")
    if (params[:saldoTipo] == "haber")
      opcion['disponible'] = reg.debe - reg.aplicaciones_haber.sum(:importe).to_f
      if params[:rad_operacion_id]
        # esta linea le vuelve a sumar lo aplicado para esa op. en particular. Ya que esta disponible
        opcion['aplicadoATransaccion'] = reg.aplicaciones_haber.where(:reg_haber_id => regOri.id).sum(:importe).to_f
        opcion['disponible'] += opcion['aplicadoATransaccion']
      end
    else
      opcion['disponible'] = reg.haber - reg.aplicaciones_debe.sum(:importe).to_f
      if params[:rad_operacion_id]
        opcion['aplicadoATransaccion'] = reg.aplicaciones_debe.where(:reg_debe_id => regOri.id).sum(:importe).to_f
        opcion['disponible'] += opcion['aplicadoATransaccion']
      end
    end
    @compatibles.push(opcion)
  end

  @compatibles = @compatibles.to_json
  unless aplicados_ids.empty?
    @aplicados = ""
    aplicados_ids.each do |ap|
      @aplicados += "#" + ap.to_s + ","
    end
    @aplicados = @aplicados[0...-1]
  end 

  respond_to do |format|
    format.js {}
  end

 end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rad_operacion
      @rad_operacion = Rad::Operacion.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def rad_operacion_params
      params.require(:rad_operacion).permit(:fecha, :importe, :operaciontipo_id, :cuotas, 
        :cuotaimporte, :ctaD_id, :ctaH_id, :desc, :esgenerado, :empresa_id, :rdosxmes, :aplicaciones, :organizacion_id,
         operacionregistros_attributes: [:id, :cuenta_id, :valor, :saldotipo, :_destroy])
    end
end
