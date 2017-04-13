class PostsController < ApplicationController
  before_action :set_post!, only: [:show, :edit, :update]

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post.update(post_params)
    if @post.valid? # checks to see if all parameters being passed at the update attempt passes all the 'validates' parameters
      @post.save
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

  def set_post!
    @post = Post.find(params[:id])
  end
end
