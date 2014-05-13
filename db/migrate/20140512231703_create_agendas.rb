class CreateAgendas < ActiveRecord::Migration
  def change
    create_table :agendas do |t|
      t.string :nombre
      t.string :telefono

      t.timestamps
    end
  end
end
