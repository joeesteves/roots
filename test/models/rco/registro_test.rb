require 'test_helper'

class Rco::RegistroTest < ActiveSupport::TestCase
  test "compatibles de cuenta saldo debe" do
  	
  	assert_kind_of(ActiveRecord::Relation, Rco::Registro.pendientes(rco_registros(:debe_clientes)), "no devuelve registros")

		
	end

	test "compatibles de cuenta saldo haber" do
		
	end
end
