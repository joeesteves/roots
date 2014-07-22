class AddActivoToRbaEstablecimientos < ActiveRecord::Migration
  def change
  	add_column :rba_establecimientos, :estado, :integer
  end
end
