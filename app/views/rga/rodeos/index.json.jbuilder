json.array!(@rga_rodeos) do |rga_rodeo|
  json.extract! rga_rodeo, :id, :estado, :codigo, :nombre, :desc
  json.url rga_rodeo_url(rga_rodeo, format: :json)
end
