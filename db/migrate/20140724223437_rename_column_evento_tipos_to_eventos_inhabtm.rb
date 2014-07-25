class RenameColumnEventoTiposToEventosInhabtm < ActiveRecord::Migration
  def change
  	 rename_column :rga_categoriatipos_eventos, :eventotipo_id, :evento_id
  end
end
