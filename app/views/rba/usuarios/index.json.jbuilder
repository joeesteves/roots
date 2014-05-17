json.array!(@rba_usuarios) do |rba_usuario|
  json.extract! rba_usuario, :id, :usuario, :nombre, :apellido, :mail, :password_digest
  json.url rba_usuario_url(rba_usuario, format: :json)
end
