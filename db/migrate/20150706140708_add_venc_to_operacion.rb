class AddVencToOperacion < ActiveRecord::Migration
  def change
  	add_column :rad_operaciones, :venc, :date
  end
end
