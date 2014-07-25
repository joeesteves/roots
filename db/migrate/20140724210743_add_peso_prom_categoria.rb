class AddPesoPromCategoria < ActiveRecord::Migration
  def change
	  add_column :rga_categorias, :pesopromedio, :decimal, :precision => 12, 
  	:scale => 4, :default => 0, :null => false
  end
end
