class CreateRgaEventotipos < ActiveRecord::Migration
  def change
    create_table :rga_eventotipos do |t|
      t.integer :estado
      t.string :codigo
      t.string :nombre
      t.string :desc

      t.timestamps
    end
  end
end
