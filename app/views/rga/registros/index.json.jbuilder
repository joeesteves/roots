json.array!(@rga_registros) do |rga_registro|
  json.extract! rga_registro, :id, :fecha, :empresa_id, :establecimiento_id
  json.evento rga_registro.evento.nombre
  json.origrodeo rga_registro.origrodeo.nombre	 rescue nil
  json.origestado rga_registro.origestado.nombre rescue nil
  json.origcategoria rga_registro.origcategoria.nombre rescue nil
  json.destcategoria rga_registro.destcategoria.nombre
  json.destrodeo rga_registro.destrodeo.nombre
  json.destestado rga_registro.destestado.nombre
  json.cantidad rga_registro.cantidad
  json.peso rga_registro.peso rescue nil
  json.desc rga_registro.desc rescue nil
end
