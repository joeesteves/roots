json.array!(@rba_campanatipos) do |rba_campanatipo|
  json.extract! rba_campanatipo, :id, :estado, :codigo, :nombre, :desc
  json.url rba_campanatipo_url(rba_campanatipo, format: :json)
end
