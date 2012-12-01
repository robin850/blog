# encoding: utf-8
class ArticlesController < ApplicationController

  load_and_authorize_resource
  
  def index
    @articles = ArticleDecorator.decorate(Article.search(params))

    if @articles.blank?
      flash[:alert] = "Aucun article trouvé."
    end
  end

  def show
    @article = ArticleDecorator.decorate(Article.find(params[:id]))

    if @article.published?
      @comments = CommentDecorator.decorate(@article.comments)
    else
      redirect_to root_path
    end
  end

  def new
    @article = Article.new
    @categories = Category.all
  end

  def create
    @article = Article.new(params[:article])

    if @article.save
      redirect_to article_path(@article)
    else
      render :action => "new"
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update_attributes(params[:article])
      redirect_to article_path(@article)
      flash[:notice] = "Article mis à jour. "
    else
      render :action => "edit"
    end
  end

  def destroy
    Article.find(params[:id]).destroy
    redirect_to articles_path
    flash[:notice] = "Article supprimé."
  end

  def read
    @articles = Article.published
    respond_to do |format|
      format.atom { render :layout => false }
    end
  end
end