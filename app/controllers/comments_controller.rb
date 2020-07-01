class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.article_id = @article.id
    if @comment.save
      @comment.make_notification
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :article_id, :user_id)
  end

end
