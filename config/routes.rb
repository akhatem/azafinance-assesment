Rails.application.routes.draw do

  devise_for :users
  namespace :api, defaults: { format: :json } do
    namespace :v1 do

    devise_for :users, controllers: { sessions: :sessions, registrations: :registrations },
                          path_names: { sign_in: :login }

    resources :payment_transactions do
        collection do
          get :index
          get :show
          post :create
        end
      end
    end
  end
end
