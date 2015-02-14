class CreateRbaOrganizaciontipos < ActiveRecord::Migration
  def change
    create_table :rba_organizaciontipos do |t|
      t.string :nombre
      t.integer :estado

      t.timestamps
    end
  end
end
