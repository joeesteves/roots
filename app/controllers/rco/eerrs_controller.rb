class Rco::EerrsController < ApplicationController
  def index
  	
  	@desde = params[:desde] || Date.today.at_beginning_of_month
  	@hasta = params[:hasta] || Date.today.at_end_of_month

  	@saldo_cuentas_resultado = Rco::Registro.saldo_cuenta_resultado(cuentas = Rco::Cuenta.xTipos([4.0, 5.0, 5.1],session[:empresagrupo_id]).collect(&:id),@desde,@hasta, session[:empresa_id])
  	@saldo_cuentas_egreso = Rco::Registro.saldo_cuenta_resultado(Rco::Cuenta.xTipos([5.0,5.1],session[:empresagrupo_id]).collect(&:id),@desde,@hasta, session[:empresa_id])
		@saldo_cuentas_ingreso = Rco::Registro.saldo_cuenta_resultado(Rco::Cuenta.xTipos([4.0],session[:empresagrupo_id]).collect(&:id),@desde,@hasta, session[:empresa_id])
		@egresos_totales = 0;
		@saldo_cuentas_egreso.map{|k,v| @egresos_totales += v.to_i}	
  	@ingresos_totales = 0;
		@saldo_cuentas_ingreso.map{|k,v| @ingresos_totales += v.to_i}	
  end
end
