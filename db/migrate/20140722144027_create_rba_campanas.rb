class CreateRbaCampanas < ActiveRecord::Migration
  def change
    create_table :rba_campanas do |t|
      t.string :estado
      t.string :codigo
      t.string :nombre
      t.string :desc
      t.references :temporada, index: true
      t.references :campanatipo, index: true

      t.timestamps
    end
  end
end
