class AddFkGas < ActiveRecord::Migration[5.0]
  def change
  	add_reference :gas, :user, index:true
  	add_foreign_key :gas, :users
  end
end
