class User < ApplicationRecord

ROLES = %i[admin guest]
   
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :assignments
  has_many :homeworks
  belongs_to :instrument

  validates :username, presence: true, uniqueness: true


  def admin?
    role == "admin"
  end

  def guest?
    role == "guest"
  end

end
