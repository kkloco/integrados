class AddColCombEcyear < ActiveRecord::Migration[5.0]
  def change
  	add_column :ecyears, :orden_combustible, :integer
  end
end
