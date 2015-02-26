class Rad::Operacionregistro < ActiveRecord::Base
  belongs_to :operacion
  belongs_to :cuenta, class_name: "Rco::Cuenta"

end
