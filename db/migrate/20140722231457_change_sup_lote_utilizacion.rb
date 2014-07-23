class ChangeSupLoteUtilizacion < ActiveRecord::Migration
  def change
  		  change_column :rba_loteutilizaciones, :superficie, :decimal, :precision => 8, 
  	:scale => 2, :default => 0, :null => false 
  end
end
