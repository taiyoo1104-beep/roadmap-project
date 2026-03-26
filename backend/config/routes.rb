Rails.application.routes.draw do
  # API用のルーティングを定義
  namespace :api do
    namespace :v1 do
      resources :roadmaps, only: [:index, :show] # 一覧と詳細のみ公開
    end
  end
end