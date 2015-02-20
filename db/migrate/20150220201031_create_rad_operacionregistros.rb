class CreateRadOperacionregistros < ActiveRecord::Migration
  def change
    create_table :rad_operacionregistros do |t|
      t.belongs_to :operacion, index: true
      t.integer :ctaD_id
      t.integer :ctaH_id
      t.decimal :valor, :precision => 12, :scale => 4

      t.timestamps
    end
  end
end
