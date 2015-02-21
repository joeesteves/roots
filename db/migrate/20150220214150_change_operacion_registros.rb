class ChangeOperacionRegistros < ActiveRecord::Migration
  def change
  	rename_column :rad_operacionregistros, :ctaD_id, :cuenta_id
  	rename_column :rad_operacionregistros, :ctaH_id, :saldotipo
  	change_column :rad_operacionregistros, :saldotipo, :string
  end
end
