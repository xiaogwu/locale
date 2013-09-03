class CommentsController < ApplicationController

	skip_before_filter :verify_authenticity_token
	respond_to :json

	def index
		@comments = Comment.all
		render json: @comments.to_json
	end 

	def create
		p = params[:post_id]
		c = params[:comment]
		c.merge!(:post_id=>p)
		respond_with Comment.create(comment_params), :location => posts_path
	end 

	def show
		@comment = Comment.find(params[:id])
		render json: @comment.to_json 
	end 

	def edit
	end 

	def update
		respond_with comment.update(params[:id], params[:comment])
	end 

	def destroy
		respond_with comment.destroy(params[:id])
	end 

	private

  def comment_params
    params.require(:comment).permit(:text, :post_id)
  end

end
