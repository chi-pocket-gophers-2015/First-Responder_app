  class SessionsController < ApplicationController
    def new
    end

    def create
      user = User.from_omniauth(env["omniauth.auth"])
      session[:user_id] = user.id
      redirect_to root_url, notice: "You have successfully logged in."
    end

    def destroy
      session[:user_id] = nil
      redirect_to root_url, notice: "You have successfully logged out."
    end

    def failure
      redirect_to root_url, alert: "Authentication failed, please try again."
    end

  # def new
  #   if current_user
  #     redirect_to user_path(current_user)
  #   else
  #     @user = User.new
  #   end
  # end

  # def create
  #   @user = User.authenticate(session_params)
  #   if @user
  #     session[:user_id] = @user.id
  #     redirect_to @user, notice: "You have successfully logged in."
  #   else
  #     @errors = ["login info is not valid"]
  #     render :new
  #   end
  # end

  # def destroy
  #   session.clear
  #   redirect_to root_path
  # end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end

end
