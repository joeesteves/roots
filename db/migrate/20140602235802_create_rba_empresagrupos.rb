class CreateRbaEmpresagrupos < ActiveRecord::Migration
  def change
    create_table :rba_empresagrupos do |t|
      t.string :codigo
      t.string :nombre
      t.text :desc

      t.timestamps
    end
  end
end
