class PostsController < ApplicationController
	before_action :set_user, except: [:index]
  before_action :set_post, only: [:edit, :update, :destroy]

  def index
  	@posts = Post.all
  end

  def show
  end

  def new
  	@post = @user.posts.build
  end

  def create
  	@post = @user.posts.build(post_params)
  	if @post.save
  		redirect_to user_path(@user)
  		flash.now["New post was created."]
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
  	if @post.update(post_params)
  		redirect_to user_path(@user)
  		flash.now["New post was updated."]
  	else
  		render :edit
  	end
  end

  def destroy
  	@post.destroy
  	redirect_to user_path(@user)
  	flash.now["Post was deleted."]
  end

  private

  	def set_user
  		@user = User.find(params[:user_id])
  	end

  	def set_post
  		@post = Post.find(params[:id])
  	end

  	def post_params
  		params.require(:post).permit(:title, :description, :price, :location, :is_sold, :created_at)
  	end
end
