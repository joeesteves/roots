json.array!(@pruebas) do |prueba|
  json.extract! prueba, :id, :nombre, :apellido
  json.url prueba_url(prueba, format: :json)
end