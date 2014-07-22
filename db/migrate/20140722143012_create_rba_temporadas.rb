class CreateRbaTemporadas < ActiveRecord::Migration
  def change
    create_table :rba_temporadas do |t|
      t.string :estado
      t.string :codigo
      t.string :nombre
      t.string :desc
      t.date :desde
      t.date :hasta

      t.timestamps
    end
  end
end
