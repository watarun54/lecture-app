Rails.application.routes.draw do
  root to: "lectures#index"
  resources :lectures, only: [:index, :show, :search] do
    collection do
      get :search
    end
  end
  resources :reviews, only: [:new, :create]
end
