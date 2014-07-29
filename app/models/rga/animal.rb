class Rga::Animal < ActiveRecord::Base
  include ModeloGlobales
  habtm_nodo
  belongs_to :madre, :foreign_key => "madre_id", :class_name => "Rga::Animal"
  belongs_to :padre, :foreign_key => "padre_id", :class_name => "Rga::Animal"
  has_many :animales_registros, :dependent => :destroy
  has_many :registros, :through => :animales_registros

  def self.disponibles(empresa_id, establecimiento_id, origcategoria_id, origrodeo_id, origestado_id)
		Rga::Animal.find_by_sql("select sc.id from (SELECT a.*, max(c.id) as 
		registro_id from rga_animales as a join rga_animales_registros as b 
		on a.id = b.animal_id join rga_registros as c on b.registro_id = c.id group by a.id) 
		as sc join rga_registros as d on sc.registro_id = d.id where 
		d.empresa_id = #{empresa_id} and
		d.establecimiento_id = #{establecimiento_id} and
		d.origcategoria_id = #{origcategoria_id} and
		d.origrodeo_id = #{origrodeo_id} and
		d.origestado_id = #{origestado_id}")

	end
end
