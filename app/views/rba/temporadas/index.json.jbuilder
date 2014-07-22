json.array!(@rba_temporadas) do |rba_temporada|
  json.extract! rba_temporada, :id, :estado, :codigo, :nombre, :desc, :desde, :hasta
  json.url rba_temporada_url(rba_temporada, format: :json)
end
