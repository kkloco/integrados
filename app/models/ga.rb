class Ga < ApplicationRecord
	self.primary_key = "numcomb"
	
    validates :numcomb, :presence=>true, :uniqueness => true
	validates :matricula, :presence=>true
	validates :importe, numericality: true
end
