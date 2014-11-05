class Rco::Aplicacion < ActiveRecord::Base
  belongs_to :reg_orig, :class_name => "Rco::Registro"
  belongs_to :reg_dest, :class_name => "Rco::Registro"
end
