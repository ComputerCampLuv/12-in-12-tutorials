class CommentsController < ApplicationController
  before_action :get_post
  before_action :get_comment, except: [:create]

  def create
    @comment = @post.comments.build(params[:comment].permit(:content))
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "Success"
      redirect_to @post
    else
      flash[:alert] = "Whoops"
      redirect_to @post
    end
  end

  def edit
  end

  def update
    if @comment.update(params[:comment].permit(:content))
      flash[:notice] = "Success"
      redirect_to @post
    else
      flash[:alert] = "Whoops"
      render 'edit'
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])

    if @comment.destroy
      flash[:notice] = "Success"
      redirect_to @post
    else
      flash[:alert] = "Whoops"
      redirect_to @post
    end
  end

  private

  def get_post
    @post = Post.find(params[:post_id])
  end

  def get_comment
    @comment = @post.comments.find(params[:id])
  end

end
