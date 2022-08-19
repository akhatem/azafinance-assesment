class RegistrationsController < Devise::RegistrationsController
  
  def create
    user = User.new(sign_up_params)

    if user.save
      @current_user = user
    else
      render json: { errors: { 'message' => 'Unable to create user' } }, status: :unprocessable_entity
    end
  end

  private

  def sign_up_params
    params.permit(
      :email,
      :password,
      :password_confirmation
    )
  end
end
