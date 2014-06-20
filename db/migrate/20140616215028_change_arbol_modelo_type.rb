class ChangeArbolModeloType < ActiveRecord::Migration
  def change
  	change_column  :rba_arboles, :modelo, :string
  end
end
