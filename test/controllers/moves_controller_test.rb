require "test_helper"

class MovesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @move = moves(:one)
  end

  test "should get index" do
    get moves_url, as: :json
    assert_response :success
  end

  test "should create move" do
    assert_difference('Move.count') do
      post moves_url, params: { move: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show move" do
    get move_url(@move), as: :json
    assert_response :success
  end

  test "should update move" do
    patch move_url(@move), params: { move: {  } }, as: :json
    assert_response 200
  end

  test "should destroy move" do
    assert_difference('Move.count', -1) do
      delete move_url(@move), as: :json
    end

    assert_response 204
  end
end
