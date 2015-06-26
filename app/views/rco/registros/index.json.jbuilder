saldo = 0
cuenta_ant_id = 0
json.array!(@rco_registros) do |rco_registro|
  orden = rco_registro.fecha.to_time.to_i + rco_registro.id
  id = rco_registro.id
  id_padre = rco_registro.asiento_id
  json.orden orden
  json.id id
  json.id_padre id_padre
  begin
    debe = rco_registro.pendienteDebe
  rescue
	 debe = rco_registro.debe
  end
  
  begin
    haber = rco_registro.pendienteHaber
  rescue
    haber = rco_registro.haber
  end
  json.debe debe
  json.haber haber
  json.desc rco_registro.desc
  json.fecha rco_registro.fecha.strftime("%d/%m/%Y") rescue nil
  cuenta = rco_registro.cuenta
  if cuenta.id == cuenta_ant_id
		saldo += debe - haber
	else
		saldo = debe - haber
	end
	json.cuenta cuenta.nombre
  json.saldo saldo
  cuenta_ant_id = cuenta.id
  if rco_registro.organizacion
    json.organizacion rco_registro.organizacion.nombre
  else
    json.organizacion "S/O"
  end
end
