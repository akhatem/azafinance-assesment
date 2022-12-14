class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }
  respond_to :json
  before_action :authenticate_user
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  

  def authenticate_user
    if request.headers['Authorization'].present?
      authenticate_or_request_with_http_token do |token|
        jwt_payload = JWT.decode(token, Rails.application.secrets.secret_key_base).first

        @current_user_id = jwt_payload['id']
      rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
        head :unauthorized
      end
    end
  end

  def authenticate_user!(_options = {})
    return head :unauthorized unless signed_in?
  end

  def authorize_customer!(_options = {})
    head :unauthorized unless current_user.customer?
  end

  def current_user
    @current_user ||= super || User.find(@current_user_id)
  end

  def signed_in?
    @current_user_id.present?
  end

  def record_not_found
    render json: {
      error: "Record not found",
    }, status: 404
  end
end
