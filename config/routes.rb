Rails.application.routes.draw do
  
  root to: 'top#index'
  
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  
  resources :gigs do
      resources :comments
      collection do
      post :confirm
      get :top
    end
  end

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :participants, only: [:create, :destroy]
  
  
  
  get '*path', controller: 'application', action: 'render_404'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
