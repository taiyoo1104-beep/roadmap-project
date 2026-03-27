Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'api/v1/login',
    sign_out: 'api/v1/logout',
    registration: 'api/v1/signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # API用のルーティングを定義
  namespace :api do
    namespace :v1 do
      resources :roadmaps, only: [:index, :show, :create, :update, :destroy]
      post 'generate_roadmap', to: 'ai_generations#create'
    end
  end
end