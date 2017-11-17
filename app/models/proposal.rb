class Proposal < ApplicationRecord

	#has_many :ecyears	

	#belongs_to :ecyear
	has_many :voucher, dependent: :delete_all

	validates :numprop,  :uniqueness => true
	validates :partida, :presence => true
	validates :importe, numericality: true

end
