class AddEmpresagrupoTorbaEstablecimientos < ActiveRecord::Migration
  def change
  	add_column :rba_establecimientos, :empresagrupo_id, :integer
  end
end
