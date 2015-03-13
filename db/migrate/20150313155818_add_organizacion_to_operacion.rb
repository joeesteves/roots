class AddOrganizacionToOperacion < ActiveRecord::Migration
  def change
  	add_column :rad_operaciones, :organizacion_id, :integer
  end
end
