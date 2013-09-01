class CommentsController < ApplicationController

	skip_before_filter :verify_authenticity_token
	respond_to :json

	def index
		@comments = Comment.all
		respond_to do |format|
			format.html # show.html.erb
		  format.json { render json: @comments.to_json(include: :comments) }
		end
	end 

	def create
		respond_with Comment.create(comment_params)
	end 

	def show
		@comment = Comment.find(params[:id])
		render json: @comment.to_json(include: :comments) 
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
    params.require(:comment).permit(:text)
  end

end
