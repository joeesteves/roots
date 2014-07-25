class CreateRgaEstadosEventos < ActiveRecord::Migration
  def change
    create_table :rga_estados_eventos do |t|
      t.string :codigo
      t.references :estado, index: true
      t.references :evento, index: true

      t.timestamps
    end
  end
end
