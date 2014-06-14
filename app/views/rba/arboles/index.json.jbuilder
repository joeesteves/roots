json.array!(@rba_arboles) do |rba_arbol|
  json.extract! rba_arbol, :id, :nombre, :model_id
  json.url rba_arbol_url(rba_arbol, format: :json)
end
