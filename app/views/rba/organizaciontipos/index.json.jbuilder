json.array!(@rba_organizaciontipos) do |rba_organizaciontipo|
  json.extract! rba_organizaciontipo, :id, :nombre, :estado, :desc
  json.url rba_organizaciontipo_url(rba_organizaciontipo, format: :json)
end
