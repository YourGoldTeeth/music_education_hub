class Homework < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  
  belongs_to :user
  belongs_to :assignment
  accepts_nested_attributes_for :assignment

  validates :name, presence: true
  validates :user_id, presence: true
  validates :assignment_id, presence: true
  validates :attachment, presence: true

  # def add_homework_id_to_assignment(a_id, h_id)
  #   assignment = Assignment.where(id: a_id)
  #   assignment.update(homework_id: h_id)
  # end  

  def add_homework_id_to_assignment(a_id, h_id)
    assignment = Assignment.where(id: a_id)
    assignment.update(homework_id: h_id)
  end  

  # def set_user!(user)
  #   self.user_id = user.id

  #   self.save!
  # end
end
