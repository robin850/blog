# encoding: utf-8
class CommentsController < ApplicationController

  load_and_authorize_resource


  def create
    @article = Article.find(params[:article_id])
    params[:comment][:admin] = true if current_user && current_user.admin?
    @comment = @article.comments.create(params[:comment])

    redirect_to article_path(@article), :notice => "Commentaire ajouté."
  end


  def edit
    @comment = Comment.find(params[:id])
  end


  def update
    @comment = Comment.find(params[:id])

    if @comment.update_attributes(params[:comment])
      redirect_to article_path(@comment.article), notice: "Commentaire mis à jour."
    else
      render :action => "edit", :alert => "Un problème est survenu."
    end
  end

end