json.array!(@rco_asientos) do |rco_asiento|
  json.extract! rco_asiento, :id, :fecha, :moneda_id, :cotizacion, :desc
  json.url rco_asiento_url(rco_asiento, format: :json)
end
