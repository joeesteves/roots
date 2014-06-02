json.array!(@holas) do |hola|
  json.extract! hola, :id, :nombre, :apellido
  json.url hola_url(hola, format: :json)
end
