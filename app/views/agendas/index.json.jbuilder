json.array!(@agendas) do |agenda|
  json.extract! agenda, :id, :nombre, :telefono
  json.url agenda_url(agenda, format: :json)
end
