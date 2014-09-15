class CreateRadOperaciontipos < ActiveRecord::Migration
  def change
    create_table :rad_operaciontipos do |t|
      t.integer :estado
      t.integer :codigo
      t.string :nombre

      t.timestamps
    end
  end
end
