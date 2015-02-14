json.array!(@rba_organizaciones) do |rba_organizacion|
  json.extract! rba_organizacion, :id, :estado, :nombre, :desc, :catfiscal_id, :idfiscal, :organizaciontipo_id
  json.url rba_organizacion_url(rba_organizacion, format: :json)
end
