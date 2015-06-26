json.array!(@rad_operaciones) do |rad_operacion|
  json.extract! rad_operacion, :id, :importe, :cuotas, :cuotaimporte, :ctaD_id, :ctaH_id, :empresa_id
  if rad_operacion.organizacion
  	json.desc rad_operacion.organizacion.nombre + " - " + rad_operacion.desc
  else
  	json.desc rad_operacion.desc
  end
  json.fecha rad_operacion.fecha.strftime("%d/%m/%Y")
  json.tipo rad_operacion.operaciontipo.nombre
  json.url rad_operacion_url(rad_operacion, format: :json)
end
