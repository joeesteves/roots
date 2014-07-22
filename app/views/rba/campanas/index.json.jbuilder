json.array!(@rba_campanas) do |rba_campana|
  json.extract! rba_campana, :id, :estado, :codigo, :nombre, :desc
  json.tipo rba_campana.campanatipo.nombre
  json.temporada rba_campana.temporada.nombre
end
