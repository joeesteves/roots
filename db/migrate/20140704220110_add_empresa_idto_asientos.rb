class AddEmpresaIdtoAsientos < ActiveRecord::Migration
  def change
    add_column :rco_asientos, :empresa_id, :integer
  end
end
