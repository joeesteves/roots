class CreateRcoCotizaciones < ActiveRecord::Migration
  def change
    create_table :rco_cotizaciones do |t|
      t.date :fecha
      t.decimal :cotizacion, :precision => 12, :scale => 4
      t.references :moneda, index: true

      t.timestamps
    end
  end
end
