class RemoveAttachmentFromAssignment < ActiveRecord::Migration[5.1]
  def change
    remove_column :assignments, :attachment, :string
  end
end
