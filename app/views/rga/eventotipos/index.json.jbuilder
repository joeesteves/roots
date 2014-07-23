json.array!(@rga_eventotipos) do |rga_eventotipo|
  json.extract! rga_eventotipo, :id, :estado, :codigo, :nombre, :desc
  json.url rga_eventotipo_url(rga_eventotipo, format: :json)
end
