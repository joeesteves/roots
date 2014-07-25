class RenameRgaCategoriaTipoEventotipoToEvento < ActiveRecord::Migration
  def change
  	rename_table :rga_categoriatipos_eventotipos, :rga_categoriatipos_eventos
  end
end
