class AddColEcyears < ActiveRecord::Migration[5.0]
  def change
  	add_column :vouchers, :orden_vale, :integer
  end
end
