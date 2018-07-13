class UsersController < ApplicationController

  def show
    render :show
  end

  def new
    render :new
  end

  def create
    user = User.new(user_params)
    exist = user.find_by(:username user.username)
    if exist.nil?
      if user.save
        login(user)
        redirect_to user_url(user)
      else
        flash[:error] = "password or username invalid"
        redirect_to new_user_url
      end
    else
      flash[:error] = "Username is taken"
      redirect_to new_user_url
    end
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
