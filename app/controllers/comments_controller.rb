# encoding: utf-8
class CommentsController < ApplicationController
  load_and_authorize_resource


  def create
    @article = Article.find(params[:article_id])
    params[:comment][:admin] = true if current_user && current_user.admin?
    @comment = @article.comments.new(params[:comment])

    if @comment.save
      flash[:notice] = "Commentaire ajouté."
    else
      flash[:alert] = "Une erreur est survenue."
    end

    redirect_to article_path(@article)
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update_attributes(params[:comment])
      flash[:notice] = "Comment mis à jour."
      redirect_to article_path(@comment.article)
    else
      flash[:alert] = "Un problème est survenu."
      render :action => "edit"
    end
  end

end
