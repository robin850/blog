# encoding: utf-8
class CategoriesController < ApplicationController

  load_and_authorize_resource

  def show
    @category = Category.find(params[:id])
    @articles = ArticleDecorator.decorate(@category.articles)
  end

end