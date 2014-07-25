json.array!(@rga_categorias) do |rga_categoria|
  json.extract! rga_categoria, :id, :estado, :codigo, :nombre, :desc
  json.tipo rga_categoria.categoriatipo.nombre
end
