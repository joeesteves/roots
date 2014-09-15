class Rad::Operaciontipo < ActiveRecord::Base
	include ModeloGlobales
  habtm_nodo
end
