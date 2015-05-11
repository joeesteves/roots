class Rba::Mailer < ActionMailer::Base
	default from: 'ajesteves@gmail.com'
	
	def vencimientos
		@rco_registros = Rco::Registro.filtros(1, Date.today.beginning_of_week,Date.today.end_of_week,[""],"1")
		mail(to: 'ajesteves@gmail.com', subject: 'Vencimientos para esta semana')
	end
end
