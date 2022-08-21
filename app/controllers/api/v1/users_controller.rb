class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:forgot_password]
  
  # api :POST, '/v1/users/forgot_password', 'forgot password'
  # api_version :v1
  # returns code: 401 do
  #   property :errors, Hash do
  #     property :message, String
  #   end
  # end

  # returns code: 200, desc: 'success'
  # def_param_group :user do
  #   param :user, Hash, required: true, action_aware: true do
  #     param :email, String, required: true
  #   end
  # end

  # param_group :user

  # def forgot_password
  #   @user = User.find_by_email(params[:email])
  #   if @user.present?
  #     @user.send_reset_password_instructions
  #     render(
  #       json: { "message": 'You will receive an email with instructions on how to reset your password in a few minutes.' }
  #     )
  #   else
  #     render(
  #       json: { "error": 'Email not found' },
  #       status: 404
  #     )
  #   end
  # end
  
  # api :POST, '/v1/users/change_password', 'change password'
  # api_version :v1
  # returns code: 401 do
  #   property :errors, Hash do
  #     property :message, String
  #   end
  # end

  # returns code: 200, desc: 'success'
  # def_param_group :user do
  #   param :user, Hash, required: true, action_aware: true do
  #     param :current_password, String, required: true
  #     param :new_password, String, required: true
  #     param :password_confirmation, String, required: true
  #   end
  # end

  # param_group :user

  # def change_password
  #   @user = current_user
  #   if @user
  #     if @user.valid_password?(params[:current_password])
  #       @user.update(password: params[:new_password], password_confirmation: params[:password_confirmation])
  #       render(
  #         json: {
  #           message: 'Password updated successfully.'
  #         },
  #         status: 200
  #       )
  #     else
  #       render(
  #         json: {
  #           error: 'Unable to change password!'
  #         },
  #         status: 401
  #       )
  #     end
  #   else
  #     render(
  #       json: {
  #         error: 'User not found!'
  #       }
  #     )
  #   end
  # end

  # api :PUT, '/v1/users/locale', 'Update user locale'
  # api_version :v1
  # returns code: 401 do
  #   property :errors, Hash do
  #     property :message, String
  #   end
  # end

  # returns code: 200, desc: 'success'

  # param :locale, %w[ar en], required: true, action_aware: true

  # def locale
  #   @user = current_user
  #   if @user && params[:locale].present?
  #     @user.update(locale: params[:locale])
  #     render(
  #       json: {
  #         message: 'Locale updated successfully.'
  #       },
  #       status: 200
  #     )
  #   else
  #     render(
  #       json: {
  #         error: 'Unable to update locale!'
  #       },
  #       status: 401
  #     )
  #   end
  # end

  # api :PUT, '/v1/users/update', 'Update user notification status'
  # api_version :v1
  # returns code: 401 do
  #   property :errors, Hash do
  #     property :message, String
  #   end
  # end

  # returns code: 200, desc: 'success'

  # param :receive_notification, %w[true false], required: true, action_aware: true
  # param :user, Hash do
  #   property :name, String
  #   property :email, String
  #   property :receive_notification, :boolean
  # end

  # def update 
  #   @user = current_user
  #   if @user && params[:receive_notification].present?
  #     @user.update(receive_notification: params[:receive_notification])
  #     render(
  #       json: {
  #         message: 'Notification Status Updated Successfully!',
  #         user: {
  #           name: @user.name,
  #           email: @user.email,
  #           receive_notification: @user.receive_notification,
  #           locale: @user.locale
  #         }
  #       },
  #       status: 200
  #     )
  #   else
  #     render(
  #       json: {
  #         errors: {
  #           message: 'Unable to update notification status!'
  #         }
  #       },
  #       status: 401
  #     )
  #   end
  # end

  # api :GET, '/v1/users/notification_status', 'get the users\'s notification status'
  # api_version :v1
  # returns code: 401 do
  #   property :errors, Hash do
  #     property :message, String
  #   end
  # end
  # returns code: 200, desc: 'a successful response' do
  #   property :users, Hash do
  #     property :receive_notification, :boolean, desc: 'notification status'
  #   end
  # end

  # def notification_status
  #   @user = current_user
  #   if @user
  #     render json: {
  #       receive_notification: @user.receive_notification
  #     }, status: 200
  #   else
  #     render json: {
  #       errors: {
  #         message: 'Unable to get notification status, make sure you are signed in!'
  #       }
  #     }, status: 401
  #   end
  # end
end
