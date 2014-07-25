class CreateRgaCategoriatiposEstados < ActiveRecord::Migration
  def change
    create_table :rga_categoriatipos_estados do |t|
      t.references :categoriatipo, index: true
      t.references :estado, index: true
    end
  end
end
