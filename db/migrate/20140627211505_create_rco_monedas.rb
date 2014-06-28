class CreateRcoMonedas < ActiveRecord::Migration
  def change
    create_table :rco_monedas do |t|
      t.string :codigo
      t.string :nombre

      t.timestamps
    end
  end
end
