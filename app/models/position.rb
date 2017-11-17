class Position < ApplicationRecord
	validates :nombre, :presence => true, :uniqueness => true, :length => {:in => 5..255}
end
