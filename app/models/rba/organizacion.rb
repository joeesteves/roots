class Rba::Organizacion < ActiveRecord::Base
  include ModeloGlobales
  habtm_nodo
  belongs_to :catfiscal
  belongs_to :organizaciontipo
  validates :nombre, :idfiscal, uniqueness: {scope: :empresagrupo_id, case_sensitive: false}
end
