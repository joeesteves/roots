class Rga::Registro < ActiveRecord::Base
	include ModeloGlobales
  habtm_nodo
  belongs_to :empresa, class_name: "Rba::Empresa"
  belongs_to :establecimiento, class_name: "Rba::Establecimiento"
  belongs_to :evento
  belongs_to :origcategoria, class_name: "Rga::Categoria"
  belongs_to :origrodeo, class_name: "Rga::Rodeo"
  belongs_to :origestado, class_name: "Rga::Estado"
  belongs_to :destcategoria, class_name: "Rga::Categoria"
  belongs_to :destrodeo, class_name: "Rga::Rodeo"
  belongs_to :destestado, class_name: "Rga::Estado"
  has_many :animales_registros
  has_many :animales, through: :animales_registros, dependent: :restrict
end
