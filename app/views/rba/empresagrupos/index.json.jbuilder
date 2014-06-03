json.array!(@rba_empresagrupos) do |rba_empresagrupo|
  json.extract! rba_empresagrupo, :id, :codigo, :nombre, :desc
  json.url rba_empresagrupo_url(rba_empresagrupo, format: :json)
end
