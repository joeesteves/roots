class CreateRbaLoteutilizaciones < ActiveRecord::Migration
  def change
    create_table :rba_loteutilizaciones do |t|
      t.integer :estado
      t.string :codigo
      t.string :nombre
      t.string :desc
      t.references :lote, index: true
      t.references :campana, index: true
      t.references :actividad, index: true
      t.decimal :superficie

      t.timestamps
    end
  end
end
