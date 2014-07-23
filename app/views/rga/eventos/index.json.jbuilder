json.array!(@rga_eventos) do |rga_evento|
  json.extract! rga_evento, :id, :estado, :codigo, :nombre, :desc
  json.tipo rga_evento.eventotipo.nombre rescue nil
end
