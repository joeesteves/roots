class CreateRcoAplicaciones < ActiveRecord::Migration
  def change
    create_table :rco_aplicaciones do |t|
      t.references :reg_orig, index: true
      t.references :reg_dest, index: true
      t.decimal :importe, :precision => 12, 
  	:scale => 4, :default => 0, :null => false 

      t.timestamps
    end
  end
end
