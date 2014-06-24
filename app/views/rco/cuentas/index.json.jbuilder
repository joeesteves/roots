json.array!(@rco_cuentas) do |rco_cuenta|
  json.extract! rco_cuenta, :id, :codigo, :nombre, :estado, :desc
  json.tipo(rco_cuenta.cuentatipo.nombre)
  json.grupo(rco_cuenta.empresagrupo.nombre)
end
