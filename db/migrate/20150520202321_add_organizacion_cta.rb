class AddOrganizacionCta < ActiveRecord::Migration
  def change
  	add_column :rco_cuentas, :organizacion_id, :integer
  end
end
