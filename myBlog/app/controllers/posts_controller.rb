class PostsController < ApplicationController

  before_action :require_user, only:[:edit, :update]
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    #@comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.user = current_user

    if post.save!
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy

    #delete post
    @post = Post.find(params[:format]) # TODO: why format? how to get id?
    @post.destroy

    #delete all comments associated with post
    @comments = @post.comments
    @comments.each do |comment|
      comment.destroy
    end
    redirect_to posts_path
  end

  def author?
    current_user == Post.find(param[:id]).user # TODO: how to get current post??
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids: [])
  end
end