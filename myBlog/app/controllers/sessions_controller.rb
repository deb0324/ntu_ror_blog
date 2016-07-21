class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by_name(params[:session][:name])

    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to posts_path
    else
      redirect_to new_session_path
    end
  end

  def destroy
    binding.pry
    session[:user_id] = nil
    redirect_to posts_path
  end


end