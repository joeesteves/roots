class ChangeSupeficeEnEstablecimientos < ActiveRecord::Migration
  def change
	  change_column :rba_establecimientos, :superficie, :decimal, :precision => 6, 
  	:scale => 2, :default => 0, :null => false 
  end
end
