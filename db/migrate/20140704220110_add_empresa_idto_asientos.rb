class AddEmpresaIdtoAsientos < ActiveRecord::Migration
  def change
    add_column :rco_asientos, :empresa_id, :integer, :precision => 12, :scale => 4
  end
end
