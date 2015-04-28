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
    @rad_operacion.operacionregistros.new(:saldo_tipo => 'debe')
    @rad_operacion.operacionregistros.new(:saldo_tipo => 'haber')
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

  def compatibles
    aplicados_ids = []
    compatibles = []
    regOri = nil
    if params[:rad_operacion_id] # cuando es edit
      operacion_id = params[:rad_operacion_id].to_i
      case params[:saldo_tipo]
      when "debe"
        regOris =  Rad::Operacion.find(operacion_id).registros.alDebe
        regOris.each do |regOri|
          compatibles = regOri.compatibles
          aplicados_ids = regOri.aplicados.collect(&:id)
        end
      when "haber"
        # regOri = Rad::Operacion.find(operacion_id).registros.alHaber.first
        regOris = Rad::Operacion.find(operacion_id).registros.alHaber
        regOris.each do |regOri|
          compatibles |= regOri.compatibles
          aplicados_ids |= regOri.aplicados.collect(&:id)
        end
      end    
    else
      compatibles = Rco::Registro.compatiblesXOrganizacion(params[:organizacion_id], params[:saldo_tipo], operaciontipo_codigo: params[:operaciontipo_codigo])
    end
    compatibles = [] if compatibles.nil?

    @compatibles = compatibleToOpciones(compatibles, params[:saldo_tipo], regOris)

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

  
  def compatibleToOpciones(compatibles, saldo_tipo, regOris)
    @compatibles = Array.new
    compatibles.each do |reg|
      opcion = Hash.new
      opcion['id'] = reg.id.to_s
      opcion['cuenta_id'] = reg.cuenta_id
      opcion['desc'] = reg.desc
      opcion['fecha'] = reg.fecha.strftime("%d/%m")
      opcion['aplicadoATransaccion'] = 0
      case saldo_tipo
      when "debe"
        inv_saldo_tipo = "haber"
        inv_saldo_tipo_metodo = "reg_debe_id".to_sym
        aplicaciones_al = "aplicaciones_debe"
      when "haber"
        inv_saldo_tipo = "debe"
        inv_saldo_tipo_metodo = "reg_haber_id".to_sym
        aplicaciones_al = "aplicaciones_haber"
      end
      opcion['disponible'] = reg.send(inv_saldo_tipo) - reg.send(aplicaciones_al).sum(:importe).to_f
      unless regOris.nil?
        regOris.each do |regOri|
          opcion['aplicadoATransaccion'] += reg.send(aplicaciones_al).where(inv_saldo_tipo_metodo => regOri.id).sum(:importe).to_f
        end
      end
      opcion['disponible'] += opcion['aplicadoATransaccion']
      @compatibles.push(opcion)
    end
    @compatibles
  end
  private


  def set_rad_operacion
    @rad_operacion = Rad::Operacion.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def rad_operacion_params
    params.require(:rad_operacion).permit(:fecha, :importe, :operaciontipo_id, :cuotas, 
      :cuotaimporte, :ctaD_id, :ctaH_id, :desc, :esgenerado, :empresa_id, :rdosxmes, :aplicaciones, :organizacion_id,
       operacionregistros_attributes: [:id, :cuenta_id, :valor, :saldo_tipo, :_destroy])
  end  
end
