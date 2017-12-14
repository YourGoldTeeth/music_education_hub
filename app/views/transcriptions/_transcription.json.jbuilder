json.extract! transcription, :id, :name, :composer, :genre, :video_game, :attachment, :created_at, :updated_at
json.url transcription_url(transcription, format: :json)
