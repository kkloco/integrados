class Ecyear < ApplicationRecord

	#belongs_to :proposal

	#has_many :proposals

	validates :ejercicio, numericality: { only_integer: true }, :length => {:minimum => 4, :maximum => 4}, :presence => true, :uniqueness => true
	validates :orden, numericality: { only_integer: true }, :presence => true
	validates :activo, numericality: { only_integer: true }, :presence => true

end
