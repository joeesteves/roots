class AddDomicicioToRbaOrganizaciones < ActiveRecord::Migration
  def change
  	add_column :rba_organizaciones, :domicilio, :text
  end
end
