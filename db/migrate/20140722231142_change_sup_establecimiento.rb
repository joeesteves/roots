class ChangeSupEstablecimiento < ActiveRecord::Migration
  def change
  	change_column :rba_establecimientos, :superficie, :decimal, :precision => 8, 
  	:scale => 2, :default => 0, :null => false 
  end
end
