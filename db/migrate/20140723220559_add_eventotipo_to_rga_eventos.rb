class AddEventotipoToRgaEventos < ActiveRecord::Migration
  def change
  	add_column :rga_eventos, :eventotipo_id, :integer
  end
end
