class AddRtadoMensualRadOperaciones < ActiveRecord::Migration
  def change
  	add_column :rad_operaciones, :rdosxmes, :boolean, default: false
  end
end
