class AddColDepidToGas < ActiveRecord::Migration[5.0]
  def change
  	add_column :gas, :dep_id, :integer
  end
end
