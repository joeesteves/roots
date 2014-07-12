json.array!(@rco_cotizaciones) do |rco_cotizacion|
  json.extract! rco_cotizacion, :id, :cotizacion
  json.fecha rco_cotizacion.fecha.strftime("%d/%m/%Y")
  json.moneda rco_cotizacion.moneda.nombre
  
end
