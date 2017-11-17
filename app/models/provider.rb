class Provider < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }, :presence => false

  validates :CIF, :presence => true, :uniqueness => true, :length => {:minimum => 9, :maximum => 9}
  validates :razon_social, :presence => true,:length => {:in => 1..254}
  validates :contacto,:length => { :maximum => 255 }
  validates :direccion,:length => { :maximum => 255 }
  validates :poblacion,:length => { :maximum => 255 }
  validates :provincia,:length => { :maximum => 255 }


  validates :tope_gasto, numericality: true
  validates :cod_postal, numericality: { only_integer: true }
  validates :tlf1, numericality: { only_integer: true }
  validates :tlf2, numericality: { only_integer: true }
  validates :fax, numericality: { only_integer: true }
  
end
