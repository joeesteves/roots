class AnimalesDefaulEstado1 < ActiveRecord::Migration
  def change
  	change_column :rga_animales, :estado, :integer, :default => 1, :null => false
  end
end
