class CreateRbaItemsNodos < ActiveRecord::Migration
  def change
    create_table :rba_items_nodos do |t|
      t.references :item, index: true
      t.references :nodo, index: true
    end
  end
end
