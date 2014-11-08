class Rco::Aplicacion < ActiveRecord::Base
  belongs_to :reg_debe, :class_name => "Rco::Registro"
  belongs_to :reg_haber, :class_name => "Rco::Registro"
end
