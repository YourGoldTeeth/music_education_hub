class CreateAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :assignments do |t|
      t.string :title
      t.integer :user_id
      t.integer :homework_id
      t.string :attachment

      t.timestamps
    end
  end
end
