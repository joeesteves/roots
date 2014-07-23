json.array!(@rga_animales) do |rga_animal|
  json.extract! rga_animal, :id, :estado, :codigo, :nombre, :alias, :rp, :color, :desc
  json.madre rga_animal.madre.rp rescue nil
  json.padre rga_animal.padre.rp rescue nil
end
