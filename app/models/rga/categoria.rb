class Rga::Categoria < ActiveRecord::Base
  include ModeloGlobales
  habtm_nodo
  belongs_to :categoriatipo
end
