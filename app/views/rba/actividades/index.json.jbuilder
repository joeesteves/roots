json.array!(@rba_actividades) do |rba_actividad|
  json.extract! rba_actividad, :id, :codigo, :nombre, :estado, :desc
  json.tipo rba_actividad.actividadtipo.nombre

end
