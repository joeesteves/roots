json.array!(@rba_actividadtipos) do |rba_actividadtipo|
  json.extract! rba_actividadtipo, :id, :codigo, :nombre, :estado
  json.url rba_actividadtipo_url(rba_actividadtipo, format: :json)
end
