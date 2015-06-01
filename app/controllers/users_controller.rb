class UsersController < ApplicationController

  def show
    return redirect_to root_path if !current_user
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      @errors = @user.errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password, :first_name, :last_name, :phone)
  end

end
