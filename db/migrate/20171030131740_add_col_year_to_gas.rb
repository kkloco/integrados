class AddColYearToGas < ActiveRecord::Migration[5.0]
  def change
  	add_column :gas, :year, :integer
  end
end
