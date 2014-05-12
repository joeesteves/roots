class CreateRbaUsuarios < ActiveRecord::Migration
  def change
    create_table :rba_usuarios do |t|
      t.string :usuario
      t.string :nombre
      t.string :apellido
      t.string :mail
      t.string :password_digest

      t.timestamps
    end
  end
end
