class CreatePruebas < ActiveRecord::Migration
  def change
    create_table :pruebas do |t|
      t.string :nombre
      t.string :apellido
      t.string :telefono

      t.timestamps
    end
  end
end
