class Homework < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  
  belongs_to :user
  belongs_to :assignment

  validates :name, presence: true
  validates :user_id, presence: true
  validates :assignment_id, presence: true
  validates :attachment, presence: true


  # def set_user!(user)
  #   self.user_id = user.id

  #   self.save!
  # end
end
