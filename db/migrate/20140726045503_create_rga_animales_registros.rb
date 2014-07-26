class CreateRgaAnimalesRegistros < ActiveRecord::Migration
  def change
    create_table :rga_animales_registros do |t|
      t.references :animal, index: true
      t.references :registro, index: true

      t.timestamps
    end
  end
end
