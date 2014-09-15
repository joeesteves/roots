json.array!(@rad_operaciones) do |rad_operacion|
  json.extract! rad_operacion, :id, :fecha, :importe, :operaciontipo_id, :cuotas, :cuotaimporte, :ctaD_id, :ctaH_id, :desc, :empresa_id
  json.url rad_operacion_url(rad_operacion, format: :json)
end
