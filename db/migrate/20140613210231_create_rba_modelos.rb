class CreateRbaModelos < ActiveRecord::Migration
  def change
    create_table :rba_modelos do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
