class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :get_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post
      flash[:notice] = "Success"
    else
      render 'new'
      flash[:error] = "Nope!"
    end
  end

  def edit
    if @post.user != current_user
      flash[:alert] = "Only the author of this post can edit"
      redirect_to @post
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post
      flash[:notice] = "Success"
    else
      render 'edit'
      flash[:error] = "Nope!"
    end
  end

  def destroy
    if @post.destroy
      redirect_to posts_path
      flash[:notice] = "Success"
    else
      redirect_back fallback_location: posts_path
      flash[:error] = "Nope!"
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end

  def get_post
    @post = Post.find(params[:id])
  end
end
