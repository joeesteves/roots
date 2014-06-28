class CreateRcoRegistros < ActiveRecord::Migration
  def change
    create_table :rco_registros do |t|
      t.date :fecha
      t.references :asiento, index: true
      t.references :cuenta, index: true
      t.decimal :debe, :precision => 12, :scale => 4 
      t.decimal :haber, :precision => 12, :scale => 4 
      t.date :vencimiento
      t.text :desc

      t.timestamps
    end
  end
end
