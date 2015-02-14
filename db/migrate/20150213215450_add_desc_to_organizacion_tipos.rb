class AddDescToOrganizacionTipos < ActiveRecord::Migration
  def change
  	 add_column :rba_organizaciontipos, :desc, :text
  end
end
