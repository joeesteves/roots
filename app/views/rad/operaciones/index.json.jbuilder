json.array!(@rad_operaciones) do |rad_operacion|
  json.extract! rad_operacion, :id, :importe, :cuotas, :cuotaimporte, :ctaD_id, :ctaH_id, :desc, :empresa_id
  json.fecha rad_operacion.fecha.strftime("%d/%m/%Y")
  json.tipo rad_operacion.operaciontipo.nombre
  json.url rad_operacion_url(rad_operacion, format: :json)
end
