class CreateResources < ActiveRecord::Migration[5.1]
  def change
    create_table :resources do |t|
      t.string :name
      t.integer :instrument_id
      t.string :attachment

      t.timestamps
    end
  end
end
