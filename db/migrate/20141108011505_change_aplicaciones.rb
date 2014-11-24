class ChangeAplicaciones < ActiveRecord::Migration
  def change
  	rename_column :rco_aplicaciones, :reg_dest_id, :reg_haber_id
  	rename_column :rco_aplicaciones, :reg_orig_id, :reg_debe_id
  end
end
