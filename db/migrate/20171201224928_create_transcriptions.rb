class CreateTranscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :transcriptions do |t|
      t.string :name
      t.string :composer
      t.string :genre
      t.string :video_game
      t.string :attachment

      t.timestamps
    end
  end
end
