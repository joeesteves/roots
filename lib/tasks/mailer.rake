task :enviar_vencimientos => :environment do
	Rba::Mailer.vencimientos.deliver
end