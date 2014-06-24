json.array!(@rco_cuentatipos) do |rco_cuentatipo|
  json.extract! rco_cuentatipo, :id, :codigo, :nombre, :estado, :desc
  json.url rco_cuentatipo_url(rco_cuentatipo, format: :json)
end
