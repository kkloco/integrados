class Car < ApplicationRecord

	self.primary_key = "matricula"
	validates :matricula, :presence=>true, :uniqueness => true
	
end
