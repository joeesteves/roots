class CreateRbaNodos < ActiveRecord::Migration
  def change
    create_table :rba_nodos do |t|
      t.string :nombre
      t.references :arbol, index: true

      t.timestamps
    end
  end
end
