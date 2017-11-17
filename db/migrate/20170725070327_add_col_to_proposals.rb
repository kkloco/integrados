class AddColToProposals < ActiveRecord::Migration[5.0]
  def change
  	add_column :proposals, :dep_id, :integer
  	add_column :proposals, :ter_id, :integer
  end
end
