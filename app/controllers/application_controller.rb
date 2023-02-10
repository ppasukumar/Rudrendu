class ApplicationController < ActionController::Base
  before_action :authenticate

  private

  def authenticate
    authenticate_or_request_with_http_basic('Administration') do |email, password|
      User.find_by(email: email)&.authenticate(password)
    end
  end

  def current_user
    @current_user ||= authenticate
  end
end
