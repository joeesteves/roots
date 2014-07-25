class Rba::Nodo < ActiveRecord::Base
  include ModeloGlobales
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

  modelos_incluidos = 
  %w(
  rba_actividades 
  rba_actividadtipos
  rba_arboles
  rba_campana
  rba_campanatipos
  rba_empresagrupos
  rba_empresas
  rba_establecimientos
  rba_lotes
  rba_loteutilizacion
  rba_nodos
  rba_temporadas
  rba_usuarios
  rco_asientos
  rco_cotizaciones
  rco_cuentas
  rco_cuentatipos
  rco_monedas
  rco_registros
  rga_animales
  rga_categorias
  rga_categoriatipos
  rga_estados
  rga_eventos
  rga_eventotipos
  rga_rodeos
  )
  habtm(modelos_incluidos)

end
