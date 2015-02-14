class AddIdFormatoToCatFiscal < ActiveRecord::Migration
  def change
  	add_column :rba_catfiscales, :idmascara, :string 
  end
end
