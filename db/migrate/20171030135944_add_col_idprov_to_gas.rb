class AddColIdprovToGas < ActiveRecord::Migration[5.0]
  def change
  	add_column :gas, :id_prov, :integer
  end
end
