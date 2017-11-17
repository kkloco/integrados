class AddUseridToCouncils < ActiveRecord::Migration[5.0]
  def change
  	add_column :councils, :user_id, :integer
  	add_index :councils, :user_id
  end
end
