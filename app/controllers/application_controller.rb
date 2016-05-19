class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def sign_in(user)
    session[:session_token] = SecureRandom.urlsafe_base64(16)
    user.update!(session_token: session[:session_token])
  end

  def sign_out
    return unless current_user
    current_user.update!(session_token: nil)
    session[:session_token] = nil
  end

  def current_user
    @current_user ||= begin
      session_token = session[:session_token]
      session_token && User.find_by_session_token(session_token)
    end
  end

  def ensure_signed_in
    redirect_to :root unless current_user
  end

  def ensure_signed_out
    redirect_to nodes_path if current_user
  end
end
