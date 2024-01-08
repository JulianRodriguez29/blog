# app/controllers/comments_controller.rb
class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:destroy]

  def create
    set_post
    @comment = @post.comments.create(comment_params)
    redirect_to @post
  end

  def destroy
    @comment.destroy
    redirect_to @post, notice: 'Comment was successfully destroyed.'
  end

  private
    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_comment
      @comment = @post.comments.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end