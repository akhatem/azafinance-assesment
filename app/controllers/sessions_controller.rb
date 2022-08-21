class SessionsController < Devise::SessionsController
  
  def create
    user = User.find_by_email(params[:email])
    if user && user.valid_password?(params[:password])
      @current_user = user
      update_fcm_token unless params[:fcm_token].blank?
      render json: {
       id:  @current_user.id,
       email: @current_user.email,
       name: @current_user.name,
       role: @current_user.role,
       token: @current_user.generate_jwt
      }, status: 200
    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
    end
  end

  private

  def update_fcm_token
    @current_user.update(fcm_token: params[:fcm_token])
  end
end
