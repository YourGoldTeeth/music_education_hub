class CreateHomeworks < ActiveRecord::Migration[5.1]
  def change
    create_table :homeworks do |t|
      t.string :name
      t.integer :user_id
      t.integer :assignment_id

      t.timestamps
    end
  end
end
