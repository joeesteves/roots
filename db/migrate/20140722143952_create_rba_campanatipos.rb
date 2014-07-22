class CreateRbaCampanatipos < ActiveRecord::Migration
  def change
    create_table :rba_campanatipos do |t|
      t.string :estado
      t.string :codigo
      t.string :nombre
      t.string :desc

      t.timestamps
    end
  end
end
