class Rad::Operacionregistro < ActiveRecord::Base
  belongs_to :operacion
  belongs_to :ctaD, class_name: "Rco::Cuenta"
  belongs_to :ctaH, class_name: "Rco::Cuenta"
end
