json.array!(@rad_operaciontipos) do |rad_operaciontipo|
  json.extract! rad_operaciontipo, :id, :estado, :codigo, :nombre
  json.url rad_operaciontipo_url(rad_operaciontipo, format: :json)
end
