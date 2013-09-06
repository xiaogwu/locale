class PostsController < ApplicationController
	include PostsHelper
	skip_before_filter :verify_authenticity_token
	respond_to :json

	def index
		lat_lng = get_position
		# binding.pry
		@posts = Post.where(lat: lat_range(lat_lng[0].to_f), lng: lng_range(lat_lng[1].to_f))
		# @posts = Post.all.includes(:comments)
		respond_to do |format|
			format.html
		  format.json { render json: @posts.to_json(include: :comments) }
		end
	end

	def create
		respond_with Post.create(post_params)
	end

	def show
		@post = Post.find(params[:id])
		render json: @post.to_json(include: :comments)
	end

	def edit
	end

	def update
		respond_with Post.update(params[:id], params[:post])
	end

	def destroy
		respond_with Post.destroy(params[:id])
	end

	private

  def post_params
    params.require(:post).permit(:body, :lat, :lng)
  end

end
