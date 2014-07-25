class CreateRgaCategorias < ActiveRecord::Migration
  def change
    create_table :rga_categorias do |t|
      t.integer :estado
      t.string :codigo
      t.string :nombre
      t.string :desc
      t.references :categoriatipo, index: true

      t.timestamps
    end
  end
end
