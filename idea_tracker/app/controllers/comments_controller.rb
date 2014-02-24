class CommentsController < ApplicationController
 def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(idea_params)
    if @comment.save
      flash[:notice] = "User commented successfully."
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
  end

  def update
  end

  def delete
    @comment = Comment.find(params[:id])
  end

  def destroy
    comment = Comment.find(params[:id]).destroy
    flash[:notice] = "Comment destroyed successfully."
    redirect_to(:action => 'index')
  end

  private

  def user_params
    params.require(:comment).permit()
  end
end
