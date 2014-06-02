class CreateHolas < ActiveRecord::Migration
  def change
    create_table :holas do |t|
      t.string :nombre
      t.string :apellido

      t.timestamps
    end
  end
end
