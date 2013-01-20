# encoding: utf-8
class ArticlesController < ApplicationController

  load_and_authorize_resource
  
  def index
    @articles = Article.search(params)
  end

  def show
    @article = Article.find(params[:id]).decorate

    if @article.published?
      @comments = CommentDecorator.decorate_collection(@article.comments)
    else
      redirect_to root_path
    end
  end

end