class AddImporteCuotaToOperaciones < ActiveRecord::Migration
  def change
  	add_column :rad_operaciones, :cuotaimporte, :decimal, :precision => 12, :scale => 4
  end
end
