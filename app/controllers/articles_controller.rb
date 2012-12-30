# encoding: utf-8
class ArticlesController < ApplicationController

  load_and_authorize_resource
  
  def index
    @articles = ArticleDecorator.decorate(Article.search(params))
  end

  def show
    @article = ArticleDecorator.decorate(Article.find(params[:id]))

    if @article.published?
      @comments = CommentDecorator.decorate(@article.comments)
    else
      redirect_to root_path
    end
  end

end