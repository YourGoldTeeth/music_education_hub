class AddAttachmentToHomeworks < ActiveRecord::Migration[5.1]
  def change
    add_column :homeworks, :attachment, :string
  end
end
