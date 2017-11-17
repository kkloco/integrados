class Council < ApplicationRecord
	#belongs_to :user
	has_many :joins, dependent: :delete_all
	has_many :users, through: :joins
	
	
	validates :nombre, :presence => true, uniqueness:{case_sensitive: false}
	validates :responsable, :presence => true
	
end
