class CommentsController < ApplicationController
  def create
    @comments = Comment.new(comment_params)
    @comments.article_id = params[:article_id]
    @comments.save
    flash.notice = "Comment succesfully posted"

    redirect_to article_path(@comments.article)
  end


  private
  def comment_params
    params.require(:comment).permit(:author_name, :body, :created_at, :article_id)
  end
end
