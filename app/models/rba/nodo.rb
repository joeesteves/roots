class Rba::Nodo < ActiveRecord::Base
  include Habtm
	habtm(%w(rba_empresas rba_arboles rba_empresagrupos 
		rba_usuarios rba_nodos pruebas rba_libros))
  belongs_to :arbol
  has_many :nodos, :foreign_key => "padre_id", :dependent => :destroy
  
 
end
