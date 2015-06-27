class Rco::EerrsController < ApplicationController
  def index
  	@desde = params[:desde] || Date.today.at_beginning_of_month
  	@hasta = params[:hasta] || Date.today.at_end_of_month
  	@saldo_cuentas_resultado = Rco::Registro.saldo_cuenta_resultado(cuentas = Rco::Cuenta.xTipos([4.0, 5.0, 5.1],session[:empresagrupo_id]).collect(&:id),@desde,@hasta, session[:empresa_id])
  	@saldo_cuentas_egreso = Rco::Registro.saldo_cuenta_resultado(Rco::Cuenta.xTipos([5.0,5.1],session[:empresagrupo_id]).collect(&:id),@desde,@hasta, session[:empresa_id])
  end
end
