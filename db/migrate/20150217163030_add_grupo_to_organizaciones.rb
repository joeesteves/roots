class AddGrupoToOrganizaciones < ActiveRecord::Migration
  def change
  	add_column :rba_organizaciones, :empresagrupo_id, :integer
  end
end
