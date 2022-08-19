class SessionsController < Devise::SessionsController
  def create
    user = User.find_by_email(params[:email])

    if user && user.valid_password?(params[:password])
      @current_user = user
      update_fcm_token unless params[:fcm_token].blank?
      puts "token: #{params[:authenticity_token]}"
    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
    end
  end

  private

  def update_fcm_token
    @current_user.update(fcm_token: params[:fcm_token])
  end
end
