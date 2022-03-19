Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'posts#index'

  resources :posts do
    resources :comments
  end

  post   'logins', to: 'logins#create'
  delete 'logout', to: 'logins#destroy'

  # get 'users/new', to: 'users#new'
  resources :users
end
