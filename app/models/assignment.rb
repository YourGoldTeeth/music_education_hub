class Assignment < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader

  belongs_to :user
  belongs_to :homework, optional: true

  validates :title, presence: true
  validates :user_id, presence: true
  # # validates :homework_id, presence: true, allow_nil: true
  validates :attachment, presence: true

 

  # has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: ":style/missing.png"

  # validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
