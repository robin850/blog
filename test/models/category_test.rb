require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "validations" do
    category = Category.new
    assert_not category.valid?

    category.title = "Dojo Toolkit"
    assert_not category.valid?

    category.slug = "dojo-toolkit"
    assert category.valid?
  end
end
