class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def method_name

  end

  def image_url(record)
    record.image_file_name != nil ? record.image.url : nil
  end

  def current_user
    @_current_user ||= User.find_by_id(session[:user_id])
  end
  helper_method :current_user

  def logged_in?
    !!current_user
  end
  helper_method :logged_in?

  def authenticate_user
    redirect_to(new_session_path) unless logged_in?
  end

  def set_address_and_zip(address, zip)
    session[:address] = address
    session[:zip]     = zip
  end

  def set_lat_and_lng(lat, lng)
    session[:lat] = lat
    session[:lng] = lng
  end

  def get_address
    session[:address]
  end

  def get_zip
    session[:zip]
  end

  def get_lat
    session[:lat]
  end

  def get_lng
    session[:lng]
  end

  def clear_address_sessions
    session[:lat]     = nil
    session[:lng]     = nil
    session[:address] = nil
    session[:zip]     = nil
  end
end
