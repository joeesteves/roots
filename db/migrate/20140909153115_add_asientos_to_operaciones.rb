class AddAsientosToOperaciones < ActiveRecord::Migration
  def change
  	add_column :rad_operaciones, :asiento_id, :integer
  end
end
