class CreateRbaOrganizaciones < ActiveRecord::Migration
  def change
    create_table :rba_organizaciones do |t|
      t.integer :estado
      t.string :nombre
      t.string :desc
      t.references :catfiscal, index: true
      t.string :idfiscal
      t.references :organizaciontipo, index: true

      t.timestamps
    end
  end
end
