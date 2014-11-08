require 'test_helper'

class Rco::CuentaTest < ActiveSupport::TestCase
  test "es cuenta corriente" do
  	assert rco_cuentas(:clientes).esCuentaCorriente?
  end

  test "no es cuenta corriente" do
  	assert_not rco_cuentas(:banco).esCuentaCorriente?
  end


end
