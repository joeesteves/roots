class AddEsgeneradotoAsiento < ActiveRecord::Migration
  def change
  	add_column :rco_asientos, :esgenerado, :boolean, default: false
  end
end
