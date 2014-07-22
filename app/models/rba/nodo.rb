class Rba::Nodo < ActiveRecord::Base
  include ModeloGlobales
	habtm(%w(rba_actividadtipos rba_actividades 
    rba_arboles rco_asientos rba_campana 
    rba_campanatipos rco_cuentas rco_cuentatipos
    rba_empresas rba_empresagrupos rba_usuarios 
    rba_nodos rba_establecimientos rba_lotes 
    rba_temporadas rco_monedas rco_cotizaciones rco_registros))
  belongs_to :arbol
  has_many :nodos, :foreign_key => "padre_id", :dependent => :destroy
  
  def self.has_items(ids)
    items = ids
    
    ids.each do |id|
      items += find(id).nodo_ids
    end

  	find_by_sql(["select a.id from
  	 rba_nodos as a join rba_items_nodos as b 
  	 on a.id = b.nodo_id where a.id IN (?)", items]).any?
	end
end
