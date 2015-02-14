json.array!(@rba_catfiscales) do |rba_catfiscal|
  json.extract! rba_catfiscal, :id, :codigo, :nombre, :desc, :idmascara
  json.url rba_catfiscal_url(rba_catfiscal, format: :json)
end
