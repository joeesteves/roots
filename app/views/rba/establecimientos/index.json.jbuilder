json.array!(@rba_establecimientos) do |rba_establecimiento|
  json.extract! rba_establecimiento, :id, :codigo, :nombre, :desc, :superficie
  json.url rba_establecimiento_url(rba_establecimiento, format: :json)
end
