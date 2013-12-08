require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  def setup
    @category = categories(:ruby)
  end

  test "should get show" do
    get :show, id: @category.id
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success

    assert_select 'form'
  end

  test "should create a new category" do
    assert_difference('Category.count', 1) do
      post :create, category: {
        title: 'Ruby on Rails',
        slug:  'ruby-on-rails'
      }
    end

    path = category_path(assigns(:category))
    assert_redirected_to path
  end

  test "should get edit" do
    get :edit, id: @category.id
    assert_response :success

    assert_select 'form'
  end

  test "should update the category" do
    ol_title = @category.title

    post :update, id: @category.id, category: {
      title: 'Rails FTW'
    }

    assert_not_equal ol_title, @category.reload.title

    path = category_path(assigns(:category))
    assert_redirected_to path
  end
end
