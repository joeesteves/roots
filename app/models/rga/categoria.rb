class Rga::Categoria < ActiveRecord::Base
  include ModeloGlobales
  habtm_nodo
  belongs_to :categoriatipo
  
  def self.categorias_disponibles(empresa_id, establecimiento_id, options = {})
  	fecha = options[:fecha] || Date.today
		categorias = Rga::Categoria.find_by_sql("select e.*, count(e.id) as existencia from (SELECT a.*, max(c.id) as 
		registro_id from rga_animales as a join rga_animales_registros as b 
		on a.id = b.animal_id join rga_registros as c on b.registro_id = c.id where c.fecha <= '#{fecha}' group by a.id) as sc 
		join rga_registros as d on sc.registro_id = d.id
		join rga_categorias as e on d.destcategoria_id = e.id
		join rga_categoriatipos as f on e.categoriatipo_id = f.id
		where d.empresa_id = #{empresa_id} and d.establecimiento_id = #{establecimiento_id} and f.codigo != -1 
		group by e.id ")
		categorias_existencias = {}
		categorias.each do |x| 
			categorias_existencias[x.id] = x.existencia
		end
		{:categorias => categorias,:existencia_x_categorias => categorias_existencias}
	end

end
