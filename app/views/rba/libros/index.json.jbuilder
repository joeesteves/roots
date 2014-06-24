json.array!(@rba_libros) do |rba_libro|
  json.extract! rba_libro, :id, :nombre, :autor, :categoria, :editorial
  json.url rba_libro_url(rba_libro, format: :json)
end
