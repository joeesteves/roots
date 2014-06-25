class ChangeRcoCuentas < ActiveRecord::Migration
  def change
  	rename_column :rco_cuentas, :rba_empresagrupo_id, :empresagrupo_id
  end
end
