class CreateRgaCategoriatiposEventotipos < ActiveRecord::Migration
  def change
    create_table :rga_categoriatipos_eventotipos do |t|
      t.references :categoriatipo, index: true
      t.references :eventotipo, index: true
    end
  end
end
