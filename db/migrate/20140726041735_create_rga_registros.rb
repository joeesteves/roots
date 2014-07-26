class CreateRgaRegistros < ActiveRecord::Migration
  def change
    create_table :rga_registros do |t|
      t.date :fecha
      t.references :empresa, index: true
      t.references :establecimiento, index: true
      t.references :evento, index: true
      t.references :origcategoria, index: true
      t.references :origrodeo, index: true
      t.references :origestado, index: true
      t.references :destcategoria, index: true
      t.references :destrodeo, index: true
      t.references :destestado, index: true
      t.integer :cantidad
      t.decimal :peso, :precision => 8, :scale => 2, :default => 0, :null => false 
      t.text :desc

      t.timestamps
    end
  end
end
