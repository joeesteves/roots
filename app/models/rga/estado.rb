class Rga::Estado < ActiveRecord::Base
  include ModeloGlobales
  habtm_nodo
	has_and_belongs_to_many :categoriatipos, table_name: "rga_categoriatipos_estados", class_name: "Rga::Categoriatipo"
	has_many :estados_eventos, table_name: "rga_estados_eventos"
	has_many :eventos, :through => :estados_eventos

	def self.estadosDisponibles(empresa_id, establecimiento_id, destcategoria_id)
			estados = Rga::Estado.find_by_sql("select g.* from (SELECT a.*, max(c.id) as 
		registro_id from rga_animales as a join rga_animales_registros as b 
		on a.id = b.animal_id join rga_registros as c on b.registro_id = c.id group by a.id) as sc 
		join rga_registros as d on sc.registro_id = d.id
		join rga_categorias as e on d.destcategoria_id = e.id
		join rga_categoriatipos as f on e.categoriatipo_id = f.id
		join rga_estados as g on d.destestado_id = g.id
		where d.empresa_id = #{empresa_id} and d.establecimiento_id = #{establecimiento_id} and
		d.destcategoria_id = #{destcategoria_id} and f.codigo != -1")
	end

end
