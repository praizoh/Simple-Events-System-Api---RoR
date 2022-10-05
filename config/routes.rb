Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'tickets/index'
      get 'tickets/show'
      get 'tickets', to: 'tickets#create'
    end
  end
  namespace :api do
    namespace :v1 do
      post 'auth/login', to: 'authentications#create'
    end
  end
  namespace :api do
    namespace :v1 do
      get 'users/index'
      get 'users/show'
      post 'signup', to: 'users#create'
    end
  end
  namespace :api do
    namespace :v1 do
      get 'events/index'
      get 'events/show'
      post 'events', to: 'events#create'
      get 'events', to: 'events#index'
      get 'events/user', to: 'events#getMyEvents'
      get 'events/:id', to: 'events#show'
      put 'events/:id', to: 'events#update'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
