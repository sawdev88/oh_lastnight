class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]


  def index
    @post = Post.new
    @posts = Post.all.order("created_at DESC").limit(20).each
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
