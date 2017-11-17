class User < ApplicationRecord

  has_many :joins, dependent: :delete_all
  has_many :councils, through: :joins

  has_many :gas, dependent: :delete_all

  has_many :proposals, dependent: :delete_all

  has_many :vouchers, dependent: :delete_all

  after_create :save_concejalias

  before_update :update_concejalias

  after_update :save_concejalias  


  def concejalias=(values)
    @concejalias = values
  end

  def save_concejalias
    if (!@concejalias.nil?)
          @concejalias.each do |concejalia|
              Join.create(council_id: concejalia, user_id: self.id)  
          end
    end
  end


  def update_concejalias
    if (!@concejalias.nil?)
      Join.where("user_id = ?", self.id).delete_all
    end
    
  end


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,  :timeoutable

  #validates :nombre, :presence => true, :uniqueness => true, :length => {:in => 3..20}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, :uniqueness => true, format: { with: VALID_EMAIL_REGEX }

  validates :dni, :presence => true, :uniqueness => true, :length => {:in => 9..9}
  validates :cargo, :presence => true
  #validates :password, :presence => true
end
