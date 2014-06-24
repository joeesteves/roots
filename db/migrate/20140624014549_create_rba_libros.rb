class CreateRbaLibros < ActiveRecord::Migration
  def change
    create_table :rba_libros do |t|
      t.string :nombre
      t.string :autor
      t.string :categoria
      t.string :editorial

      t.timestamps
    end
  end
end
