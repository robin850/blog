# encoding: utf-8
class CategoriesController < ApplicationController

  load_and_authorize_resource

  def show
    @category = Category.find(params[:id])
    @articles = ArticleDecorator.decorate(@category.articles)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])

    if @category.save
      redirect_to category_path(@category)
    else
      render :action => "new"
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update_attributes(params[:category])
      redirect_to category_path(@category)
    else
      render :action => "edit"
    end
  end
end