class ApplicationController < ActionController::API
  before_action :authenticate_request
  attr_reader :current_user

  private

  def authenticate_request
    @current_user = user
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end

  def user
    User.find(decoded_auth_token[:user_id]) if decoded_auth_token
  end

  def decoded_auth_token
    @decoded_auth_token ||= JSONWebToken.decode(http_auth_header)
  end

  def http_auth_header
    if request.headers['Authorization'].present?
      return request.headers['Authorization'].split(' ').last
    end
  end
end
