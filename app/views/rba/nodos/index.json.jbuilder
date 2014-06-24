json.array!(@rba_nodos) do |rba_nodo|
  json.extract! rba_nodo, :id, :nombre, :padre_id
  json.arbol(rba_nodo.arbol.nombre)

end
