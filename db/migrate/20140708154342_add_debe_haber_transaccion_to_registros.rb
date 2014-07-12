class AddDebeHaberTransaccionToRegistros < ActiveRecord::Migration
  def change
  	add_column :rco_registros, :debe_op, :decimal, :precision => 12, :scale => 4 
  	add_column :rco_registros, :haber_op, :decimal, :precision => 12, :scale => 4 
  end
end
