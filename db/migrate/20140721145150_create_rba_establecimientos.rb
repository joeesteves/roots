class CreateRbaEstablecimientos < ActiveRecord::Migration
  def change
    create_table :rba_establecimientos do |t|
      t.string :codigo
      t.string :nombre
      t.text :desc
      t.integer :superficie

      t.timestamps
    end
  end
end
