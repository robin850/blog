class CategoriesController < ApplicationController
  permits :title, :slug

  def show(id)
    @category = Category.find(id)
  end

  def new
    @category = Category.new
  end

  def edit(id)
    @category = Category.find(id)
  end

  def create(category)
    @category = Category.new(category)

    if @category.save
      redirect_to @category
    else
      render action: 'new'
    end
  end

  def update(id, category)
    @category = Category.find(id)

    if @category.update_attributes(category)
      redirect_to @category
    else
      render action: 'edit'
    end
  end
end
