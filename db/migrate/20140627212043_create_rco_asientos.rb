class CreateRcoAsientos < ActiveRecord::Migration
  def change
    create_table :rco_asientos do |t|
      t.date :fecha
      t.references :moneda, index: true
      t.decimal :cotizacion, :precision => 12, :scale => 4 
      t.text :desc

      t.timestamps
    end
  end
end
