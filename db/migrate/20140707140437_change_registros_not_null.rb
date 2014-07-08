class ChangeRegistrosNotNull < ActiveRecord::Migration
  def change
  	change_column :rco_registros, :debe, :decimal, :precision => 12, 
  	:scale => 4, :default => 0, :null => false 
     change_column :rco_registros, :haber, :decimal, :precision => 12, 
  	:scale => 4, :default => 0, :null => false
  end
end
