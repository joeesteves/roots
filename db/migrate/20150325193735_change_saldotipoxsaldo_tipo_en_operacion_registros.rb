class ChangeSaldotipoxsaldoTipoEnOperacionRegistros < ActiveRecord::Migration
  def change
  	rename_column :rad_operacionregistros, :saldotipo, :saldo_tipo
  end
end
