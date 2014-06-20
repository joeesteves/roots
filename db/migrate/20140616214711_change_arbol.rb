class ChangeArbol < ActiveRecord::Migration
  def change
  	rename_column :rba_arboles, :model_id, :modelo
  end
end
