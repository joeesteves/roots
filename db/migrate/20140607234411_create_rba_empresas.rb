class CreateRbaEmpresas < ActiveRecord::Migration
  def change
    create_table :rba_empresas do |t|
      t.string :codigo
      t.string :nombre
      t.references :catfiscal, index: true
      t.string :cuit
      t.references :empresagrupo, index: true

      t.timestamps
    end
  end
end
