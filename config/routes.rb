Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: :sessions, registrations: :registrations },
                         path_names: { sign_in: :login }
  constraints format: :json do
    resources :transactions do
      collection do
        get :index
        get :show
        post :create
      end
    end
  end
end
