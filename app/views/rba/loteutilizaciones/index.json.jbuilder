json.array!(@rba_loteutilizaciones) do |rba_loteutilizacion|
  json.extract! rba_loteutilizacion, :id, :estado, :codigo, :nombre, :desc, :superficie
  json.actividad rba_loteutilizacion.actividad.nombre
  json.camapana rba_loteutilizacion.campana.nombre
  json.lote rba_loteutilizacion.lote.nombre
end
