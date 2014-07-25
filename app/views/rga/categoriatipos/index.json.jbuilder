json.array!(@rga_categoriatipos) do |rga_categoriatipo|
  json.extract! rga_categoriatipo, :id, :estado, :codigo, :nombre, :desc
  json.url rga_categoriatipo_url(rga_categoriatipo, format: :json)
end
