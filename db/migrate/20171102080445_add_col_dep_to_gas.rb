class AddColDepToGas < ActiveRecord::Migration[5.0]
  def change

  	add_column :gas, :departamento, :string
  end
 
end
