class Resource < ApplicationRecord
	mount_uploader :attachment, AttachmentUploader
	belongs_to :instrument
end
