class ChangeCantidadDefault1inRgaRegistros < ActiveRecord::Migration
  def change
  	change_column :rga_registros, :cantidad, :integer, :default => 1, :null => false 
  end
end
