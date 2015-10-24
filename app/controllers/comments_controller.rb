class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment_hash = params[:comment]
    @commentable = Comment.find_commentable(@comment_hash[:commentable_type], @comment_hash[:commentable_id])
    @comment = Comment.build_from(@commentable, current_user.id, @comment_hash[:body])
    if @comment.save
      render :partial => "comments/comment", :locals => { :comment => @comment }, :layout => false, :status => :created
    else
      render :js => "alert('error saving comment');"
    end
  end

  def update
    @comment.update(comment_params)
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      render :json => @comment, :status => :ok
    else
      render :js => "alert('error deleting comment');"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
