class AddParentIdToRbaNodos < ActiveRecord::Migration
  def change
    add_column :rba_nodos, :padre_id, :integer
  end
end
