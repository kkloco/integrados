class AddColEcyearsNew < ActiveRecord::Migration[5.0]
  def change
  	add_column :ecyears, :orden_vale, :integer
  end
end
