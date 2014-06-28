json.array!(@rco_monedas) do |rco_moneda|
  json.extract! rco_moneda, :id, :codigo, :nombre
  json.url rco_moneda_url(rco_moneda, format: :json)
end
