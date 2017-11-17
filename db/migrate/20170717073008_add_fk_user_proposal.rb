class AddFkUserProposal < ActiveRecord::Migration[5.0]
  def change
  	add_reference :proposals, :user, index:true
  	add_foreign_key :proposals, :users
  end
end
