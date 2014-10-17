class Rfi::FlujofondosController < ApplicationController
	
	def index
		# variablr
		empresaGrupoId = session[:empresagrupo_id]
		empresaId = session[:empresa_id]
		hoy = Date.today()
		@rep = 12 
		
		fin = hoy.advance(:months => @rep - 1) 
		hasta = Date.new(fin.year,fin.month, -1)
		ctasAlInicio = Rco::Cuenta.conSaldo([1.1,1.2,2.2],hoy,empresaGrupoId)
		ctasAlFin = Rco::Cuenta.conSaldo([1.1,1.2,2.2],hoy,empresaGrupoId)
		@ctasDisp = ctasAlInicio | ctasAlFin
		ctasDispIds = @ctasDisp.collect(&:id)
		@sDI = Rco::Registro.saldoCta(ctasDispIds,hoy,empresaId) # saldos iniciales
		sDI = Array.new
		@sDI.each {|k,v| sDI.push(v)}
		@sDITotal = sDI.sum

		@sDF = Rco::Registro.saldoCta(ctasDispIds,hasta,empresaId) # saldos finales 
		sDF = Array.new
		@sDF.each {|k,v| sDF.push(v)}
		@sDFTotal = sDF.sum
		@sMes = Array.new	
		@sMesTotales = Array.new
		@rep.times do |t|
			sMes = Array.new
			if t == 0
				@sMes[t] = Rco::Registro.saldoPeriodoCta(ctasDispIds,hoy,Date.new(hoy.year,hoy.month,-1),empresaId)
			else	
				@sMes[t] = Rco::Registro.saldoMesCta(ctasDispIds,hoy.advance(:months => t),empresaId)
			end
			@sMes[t].each {|k,v| sMes.push(v)} 
			@sMesTotales[t] = sMes.sum

		end
		@meses = ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre']
		respond_to do |format|
			format.html

		end


	end
end
