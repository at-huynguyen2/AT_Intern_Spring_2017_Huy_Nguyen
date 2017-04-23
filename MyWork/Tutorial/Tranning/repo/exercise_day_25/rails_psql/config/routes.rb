Rails.application.routes.draw do
  get 'user/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/users/:id', to: 'user#id'

  resources :users, only: [:index, :show, :create, :update, :detroy] do
      resources :posts, only: [:index, :create] do
        collection do
          get 'follow_users'
        end
        member do
          get 'recent_posts'
        end
      end
  end

  namespace :admin do
    resources :users, only: [:index]
    resources :posts, only: [:index]
  end

end
