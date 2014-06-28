json.array!(@rco_registros) do |rco_registro|
  json.extract! rco_registro, :id, :fecha, :asiento_id, :cuenta_id, :debe, :haber, :vencimiento, :desc
  json.url rco_registro_url(rco_registro, format: :json)
end
