json.array!(@rco_cotizaciones) do |rco_cotizacion|
  json.extract! rco_cotizacion, :id, :fecha, :cotizacion, :moneda_id
  json.url rco_cotizacion_url(rco_cotizacion, format: :json)
end
