saldo = 0
cuenta_ant_id = 0
json.array!(@rco_registros) do |rco_registro|
  orden = rco_registro.fecha.to_time.to_i + rco_registro.id
  id = rco_registro.id
  id_padre = rco_registro.asiento_id
  json.orden orden
  json.id id
  json.id_padre id_padre
  json.extract! rco_registro, :debe, :haber, :desc
  json.fecha rco_registro.fecha.strftime("%d/%m/%Y") rescue nil
	cuenta = rco_registro.cuenta
	if cuenta.id == cuenta_ant_id
		saldo += rco_registro.debe - rco_registro.haber
	else
		saldo = rco_registro.debe - rco_registro.haber
	end
	json.cuenta cuenta.nombre
  json.saldo saldo
  cuenta_ant_id = cuenta.id
  json.desc_asiento rco_registro.asiento.desc rescue nil
end
