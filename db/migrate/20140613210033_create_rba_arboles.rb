class CreateRbaArboles < ActiveRecord::Migration
  def change
    create_table :rba_arboles do |t|
      t.string :nombre
      t.references :model, index: true

      t.timestamps
    end
  end
end
