json.array!(@rga_estados) do |rga_estado|
  json.extract! rga_estado, :id, :estado, :nombre, :desc
  json.url rga_estado_url(rga_estado, format: :json)
end
