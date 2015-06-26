class Api::Rba::CajasController < ApplicationController
  def caja
  	@caja = Rco::Cuenta.xTipos('1.1', 1).where("rco_cuentas.nombre like 'CAJA%'").first
  	saldo =  Rco::Registro.saldoCta([@caja.id], Date.today, 1)[@caja.id]
  	@caja =  @caja.attributes.merge({saldo: saldo})
  	render json: @caja
  end

  def egresos
  	@cuentas_egresos = Rco::Cuenta.xTipos('5.1', 1)
  	render json: @cuentas_egresos
  end

  def create
    rad_operacion = Rad::Operacion.new
    rad_operacion.empresa_id = session[:empresa_id]
    rad_operacion.fecha = Date.today
    reg_debe = rad_operacion.operacionregistros.new(:saldo_tipo => 'debe')
    reg_debe.cuenta_id = params[:cuenta_id]
    reg_debe.valor = params[:importe]
    reg_haber = rad_operacion.operacionregistros.new(:saldo_tipo => 'haber')
    reg_haber.cuenta_id = params[:caja_id]
    reg_haber.valor = params[:importe]
    operacionCodigo = -1 # Se define por default el egreso (-1) que es la mas habitual
    rad_operacion.operaciontipo_id = Rad::Operaciontipo.where(:codigo => operacionCodigo).last.id
    rad_operacion.importe = params[:importe]
    rad_operacion.desc = params[:desc] ||= ''
    rad_operacion.cuotas = 1
    rad_operacion.cuotaimporte = params[:importe]
    if rad_operacion.rSave(nil,nil)
      render nothing: true
    else 
      render nothing: true, status: 500
    end
  end

end
