json.array!(@rga_estados_eventos) do |rga_estados_evento|
  json.extract! rga_estados_evento, :id, :codigo, :estado_id, :evento_id
  json.url rga_estados_evento_url(rga_estados_evento, format: :json)
end
