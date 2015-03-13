class AddOrganizacionToRegistros < ActiveRecord::Migration
  def change
  	add_column :rco_registros, :organizacion_id, :integer
  end
end
