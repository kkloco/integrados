class CreateCouncilsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :councils_users, :id => false do |t|

    	t.references :user
    	t.references :council
    end
    	
  end
end
