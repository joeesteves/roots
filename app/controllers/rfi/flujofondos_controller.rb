class Rfi::FlujofondosController < ApplicationController
	
	def index
		# empresa = session[:empresa_id]
		# hoy = Date.today()
		# @rep = 12 
		# fin = hoy.advance(:months => @rep - 1) 
		# hasta = Date.new(fin.year,fin.month, -1)
		# @CtasInicio = Cuenta.conSaldo([1,2,3],hoy,empresa)
		# @CtasFin = Cuenta.conSaldo([1,2,3],hasta,empresa)
		# @ctasDisp = @CtasInicio | @CtasFin
		# ctasDispId = @ctasDisp.collect(&:id)
		# @sDI = Asiento.saldoCta(ctasDispId,hoy,empresa) # saldos iniciales
		# sDI = Array.new()
		# @sDI.each {|k,v| sDI.push(v)}
		# @sDITotal = sDI.sum

		# @sDF = Asiento.saldoCta(ctasDispId,hasta,empresa) # saldos finales 
		# sDF = Array.new()
		# @sDF.each {|k,v| sDF.push(v)}
		# @sDFTotal = sDF.sum
		# @sMes = Array.new	
		# @sMesTotales = Array.new
		# @rep.times do |t|
		# 	sMes = Array.new
		# 	if t == 0
		# 		@sMes[t] = Asiento.saldoPeriodoCta(ctasDispId,hoy,Date.new(hoy.year,hoy.month,-1),empresa)
		# 	else	
		# 		@sMes[t] = Asiento.saldoMesCta(ctasDispId,hoy.advance(:months => t),empresa)
		# 	end
		# 	@sMes[t].each {|k,v| sMes.push(v)} 
		# 	@sMesTotales[t] = sMes.sum

		# end
		# @meses = ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre']
		# respond_to do |format|
		# 	format.html

		# end


	end
end
