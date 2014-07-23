class CreateRgaAnimales < ActiveRecord::Migration
  def change
    create_table :rga_animales do |t|
      t.integer :estado
      t.string :codigo
      t.string :nombre
      t.string :alias
      t.string :rp
      t.string :color
      t.string :desc
      t.references :madre, index: true
      t.references :padre, index: true

      t.timestamps
    end
  end
end
