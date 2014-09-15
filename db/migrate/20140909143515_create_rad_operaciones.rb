class CreateRadOperaciones < ActiveRecord::Migration
  def change
    create_table :rad_operaciones do |t|
      t.date :fecha
      t.decimal :importe, :precision => 12, :scale => 4
      t.references :operaciontipo, index: true
      t.integer :cuotas, :default => 1 
      t.references :ctaD, index: true
      t.references :ctaH, index: true
      t.text :desc
      t.references :empresa, index: true

      t.timestamps
    end
  end
end
