require 'test_helper'

class TranscriptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transcription = transcriptions(:one)
  end

  test "should get index" do
    get transcriptions_url
    assert_response :success
  end

  test "should get new" do
    get new_transcription_url
    assert_response :success
  end

  test "should create transcription" do
    assert_difference('Transcription.count') do
      post transcriptions_url, params: { transcription: { attachment: @transcription.attachment, composer: @transcription.composer, genre: @transcription.genre, name: @transcription.name, video_game: @transcription.video_game } }
    end

    assert_redirected_to transcription_url(Transcription.last)
  end

  test "should show transcription" do
    get transcription_url(@transcription)
    assert_response :success
  end

  test "should get edit" do
    get edit_transcription_url(@transcription)
    assert_response :success
  end

  test "should update transcription" do
    patch transcription_url(@transcription), params: { transcription: { attachment: @transcription.attachment, composer: @transcription.composer, genre: @transcription.genre, name: @transcription.name, video_game: @transcription.video_game } }
    assert_redirected_to transcription_url(@transcription)
  end

  test "should destroy transcription" do
    assert_difference('Transcription.count', -1) do
      delete transcription_url(@transcription)
    end

    assert_redirected_to transcriptions_url
  end
end
