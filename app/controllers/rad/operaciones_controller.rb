class Rad::OperacionesController < ApplicationController
  before_action :set_rad_operacion, only: [:show, :edit, :update, :destroy]
  
  # GET /rad/operaciones
  def index
    arbol_index(params[:nodo], { flash_nodo: flash[:nodo], includes: [:operaciontipo, :organizacion], contexto: "empresa"})
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
  end

  # GET /rad/operaciones/1/edit
  def edit
    @cuentas = Rco::Cuenta.xOperacionTipo(@rad_operacion.operaciontipo.codigo.to_s, session[:empresagrupo_id])
  end

  # POST /rad/operaciones
  def create

    @rad_operacion = Rad::Operacion.new(rad_operacion_params)
    @rad_operacion.empresa_id = session[:empresa_id]
    aplicaciones_origen = params[:aplicaciones_origen]
    aplicaciones_destino = params[:aplicaciones_destino]
    if @rad_operacion.rSave(aplicaciones_origen, aplicaciones_destino)
      redirect_to rad_operaciones_path, notice: 'Operacion guardado.'
      ubica_en_nodo(params[:nodo])
    else
      @cuentas = Rco::Cuenta.xOperacionTipo(@rad_operacion.operaciontipo.codigo.to_s, session[:empresagrupo_id])
      render action: 'new'
    end
  end

  # PATCH/PUT /rad/operaciones/1
  def update
    aplicaciones_origen = params[:aplicaciones_origen]
    aplicaciones_destino = params[:aplicaciones_destino]

    if @rad_operacion.rUpdate(rad_operacion_params, aplicaciones_origen, aplicaciones_destino)
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
    aplicados_origen_ids = []
    compatibles_origen = []
    registros_origen = nil
    aplicados_destino_ids = []
    compatibles_destino = []
    registros_destino = nil
    if params[:rad_operacion_id] # cuando es edit
      @rad_operacion = Rad::Operacion.find(params[:rad_operacion_id])
      compatibles_aplicados = @rad_operacion.compatibles_aplicados
      compatibles_origen = compatibles_aplicados['origen']['compatibles']
      aplicados_origen_ids = compatibles_aplicados['origen']['aplicados']
      registros_origen = compatibles_aplicados['origen']['registros']
      compatibles_destino = compatibles_aplicados['destino']['compatibles']
      aplicados_destino_ids = compatibles_aplicados['destino']['aplicados']
      registros_destino = compatibles_aplicados['destino']['registros']
    else # When new
      compatibles_origen = Rco::Registro.compatibles_organizacion(params[:organizacion_id], params[:operaciontipo_codigo].to_i)['origen']
      compatibles_destino = Rco::Registro.compatibles_organizacion(params[:organizacion_id], params[:operaciontipo_codigo].to_i)['destino']     
    end
    unless compatibles_origen.presence.nil?
      compatibles_origen = compatibles_a_opciones(compatibles_origen, params[:operaciontipo_codigo].to_i, registros_origen, 'origen')
    end
    compatibles_origen ||= []
    @compatibles_origen = compatibles_origen.to_json 
    unless compatibles_destino.presence.nil?
      compatibles_destino = compatibles_a_opciones(compatibles_destino, params[:operaciontipo_codigo].to_i, registros_destino, 'destino')
    end
    compatibles_destino ||= []
    @compatibles_destino = compatibles_destino.to_json


    unless aplicados_origen_ids.presence.nil?
      @aplicados_origen_ids = ""
      aplicados_origen_ids.each do |ap|
        @aplicados_origen_ids += "#" + ap.to_s + ","
      end
      @aplicados_origen_ids = @aplicados_origen_ids[0...-1]
    end 

    unless aplicados_destino_ids.presence.nil?
      @aplicados_destino_ids = ""
      aplicados_destino_ids.each do |ap|
        @aplicados_destino_ids += "#" + ap.to_s + ","
      end
      @aplicados_destino_ids = @aplicados_destino_ids[0...-1]
    end 
    respond_to do |format|
      format.js {}
    end
  end

  
  def compatibles_a_opciones(compatibles, codigo, registros, origen_o_destino)
    compatibles_array = []
    compatibles.each do |compatible|
      opcion = Hash.new
      opcion['id'] = compatible.id.to_s
      opcion['cuenta_id'] = compatible.cuenta_id
      opcion['desc'] = compatible.desc
      opcion['fecha'] = compatible.fecha.strftime("%d/%m")
      opcion['aplicado_a_registro'] = 0
      vars = Rad::Operacion.set_vars(origen_o_destino, codigo)
      if registros.nil?
        opcion['disponible'] = compatible.send(vars[:valor_al]) - compatible.send(vars[:inv_valor_al_metodo_aplica]).sum(:importe).to_f
      else
        compatible_registros_aplicados = compatible.send(vars[:inv_valor_al_metodo_aplica])
        valor_compatible_registros_aplicados = compatible_registros_aplicados.sum(:importe).to_f
        opcion['disponible'] = compatible.send(vars[:valor_al]) - valor_compatible_registros_aplicados
        opcion['aplicado_a_registro'] = valor_compatible_registros_aplicados - compatible_registros_aplicados.where
        .not('rco_aplicaciones.' + vars[:inv_valor_al_metodo_reg_string] + ' in (?)', registros.collect(&:id)).sum(:importe).to_f
        opcion['disponible'] += opcion['aplicado_a_registro']
      end       
      compatibles_array.push(opcion)
    end
    compatibles_array
  end

  private
  def set_rad_operacion
    @rad_operacion = Rad::Operacion.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def rad_operacion_params
    params.require(:rad_operacion).permit(:fecha, :importe, :operaciontipo_id, :cuotas, 
      :cuotaimporte, :ctaD_id, :ctaH_id, :desc, :esgenerado, :empresa_id, :rdosxmes, :organizacion_id,
      :aplicaciones_origen, :aplicaciones_destino, :comprobante, 
      operacionregistros_attributes: [:id, :cuenta_id, :valor, :saldo_tipo, :_destroy])
  end
end
