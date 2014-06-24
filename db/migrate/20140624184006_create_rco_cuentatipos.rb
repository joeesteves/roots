class CreateRcoCuentatipos < ActiveRecord::Migration
  def change
    create_table :rco_cuentatipos do |t|
      t.string :codigo
      t.string :nombre
      t.integer :estado
      t.text :desc

      t.timestamps
    end
  end
end
