class CreateRgaRodeos < ActiveRecord::Migration
  def change
    create_table :rga_rodeos do |t|
      t.integer :estado
      t.string :codigo
      t.string :nombre
      t.string :desc

      t.timestamps
    end
  end
end
