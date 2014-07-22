class CreateRbaActividadtipos < ActiveRecord::Migration
  def change
    create_table :rba_actividadtipos do |t|
      t.string :codigo
      t.string :nombre
      t.integer :estado

      t.timestamps
    end
  end
end
