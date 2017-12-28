class User < ApplicationRecord
# ROLES = %i[admin guest]
   
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :assignments
  has_many :homeworks
  belongs_to :instrument
  belongs_to :role
  before_validation :set_default_role 
  before_validation :set_validation_id 

  validates :username, presence: true, uniqueness: true


  def admin?
    role == "admin"
  end

  def guest?
    role == "student"
  end

  private
  def set_default_role
    self.role ||= Role.find_by_name('student')
  end 

  def set_validation_id
    self.update_attribute(:notification_id, 0)
  end

end
