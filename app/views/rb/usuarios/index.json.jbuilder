json.array!(@rb_usuarios) do |rb_usuario|
  json.extract! rb_usuario, :id, :usuario, :nombre, :apellido, :mail, :password_digest
  json.url rb_usuario_url(rb_usuario, format: :json)
end
