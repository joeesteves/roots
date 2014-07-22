class CreateRbaLotes < ActiveRecord::Migration
  def change
    create_table :rba_lotes do |t|
      t.integer :estado
      t.string :codigo
      t.string :nombre
      t.text :desc
      t.references :establecimiento, index: true

      t.timestamps
    end
  end
end
