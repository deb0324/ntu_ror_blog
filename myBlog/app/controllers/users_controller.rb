class UsersController < ApplicationController

  def index
    
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(session[:user_id])
  end

  def create
    @user = User.create(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to posts_path
    else
      redirect_to :new
    end
  end

  def author?
    binding.pry
    current_user == Post.find(param[:id]).user # TODO: how to get current post??
  end
  private

  def user_params
    params.require(:user).permit(:username, :password, :nickname)
  end
end