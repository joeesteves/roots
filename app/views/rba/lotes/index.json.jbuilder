json.array!(@rba_lotes) do |rba_lote|
  json.extract! rba_lote, :id, :estado, :codigo, :nombre, :desc
  json.establecimiento rba_lote.establecimiento.nombre
end
