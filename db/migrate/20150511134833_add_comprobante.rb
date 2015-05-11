class AddComprobante < ActiveRecord::Migration
  def change
  	add_column :rad_operaciones, :comprobante, :string
  end
end
