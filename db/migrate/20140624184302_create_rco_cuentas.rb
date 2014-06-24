class CreateRcoCuentas < ActiveRecord::Migration
  def change
    create_table :rco_cuentas do |t|
      t.string :codigo
      t.string :nombre
      t.integer :estado
      t.text :desc
      t.references :cuentatipo, index: true
      t.references :rba_empresagrupo, index: true

      t.timestamps
    end
  end
end
