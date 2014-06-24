class Rco::Cuenta < ActiveRecord::Base
  include Habtmnodo
  habtm_nodo
  belongs_to :cuentatipo
  belongs_to :empresagrupo, :class_name => "Rba::Empresagrupo",
   :foreign_key => "rba_empresagrupo_id"
end
