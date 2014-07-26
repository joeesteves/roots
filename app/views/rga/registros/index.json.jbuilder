json.array!(@rga_registros) do |rga_registro|
  json.extract! rga_registro, :id, :fecha, :empresa_id, :establecimiento_id, :evento_id,:origrodeo_id, :origestado_id, :destcategoria_id, :destrodeo_id, :destestado_id, :cantidad, :peso, :desc
  json.origcategoria rga_registro.origcategoria.nombre
end
