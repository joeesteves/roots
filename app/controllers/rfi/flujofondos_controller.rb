class Rfi::FlujofondosController < ApplicationController
	
	def index
		empresaGrupoId = session[:empresagrupo_id]
		empresaId = session[:empresa_id]
		hoy = Date.today
		@rep = 8 
		tiposDeCuenta = [1.12,1.2,1.9,2.2,2.9,2.1]
		fin = hoy.advance(:months => @rep - 2) 
		hasta = Date.new(fin.year,fin.month, -1)
		ctasAlInicio = Rco::Cuenta.conSaldo(tiposDeCuenta,hoy,empresaGrupoId)
		ctasAlFin = Rco::Cuenta.conSaldo(tiposDeCuenta,hasta,empresaGrupoId)
		@ctasDisp = ctasAlInicio | ctasAlFin
		@ctasDisp.sort! { |a,b| a.cuentatipo_codigo <=> b.cuentatipo_codigo }
		ctasDispIds = @ctasDisp.collect(&:id)
		@sDI = Rco::Registro.saldoCta(ctasDispIds,hoy,empresaId) # saldos iniciales
		sDI = Array.new
		@sDI.each {|k,v| sDI.push(v)}
		@sDITotal = sDI.sum.round(2)

		@sDF = Rco::Registro.saldoCta(ctasDispIds,hasta,empresaId) # saldos finales 
		sDF = Array.new
		@sDF.each {|k,v| sDF.push(v)}
		@sDFTotal = sDF.sum.round(2)
		@sMes = Array.new	
		@sMesTotales = Array.new
		@rep.times do |t|
			sMes = Array.new
			if t == 0
				@sMes[t] = Rco::Registro.saldoPeriodoCta(ctasDispIds,hoy,Date.today.end_of_month,empresaId)
			else	
				@sMes[t] = Rco::Registro.saldoMesCta(ctasDispIds,hoy.advance(:months => t),empresaId)
			end
			@sMes[t].each {|k,v| sMes.push(v)} 
			@sMesTotales[t] = sMes.sum.round(2)

		end
		@meses = ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre']
		respond_to do |format|
			format.html

		end


	end
end
