class CreateRbaActividades < ActiveRecord::Migration
  def change
    create_table :rba_actividades do |t|
      t.string :codigo
      t.string :nombre
      t.integer :estado
      t.text :desc
      t.references :actividadtipo, index: true

      t.timestamps
    end
  end
end
