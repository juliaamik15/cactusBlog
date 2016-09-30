class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    @comment.user = current_user
  	@comment.save
    redirect_to article_path(@article)
  end
	

	def destroy
		@comment=Comment.find(params[:id])
		article=@comment.article
		@comment.destroy
		redirect_to article
	end

	private
    def comment_params
      params.require(:comment).permit(:user_id, :body)
    end
	
end
