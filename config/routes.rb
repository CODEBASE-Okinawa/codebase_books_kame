Rails.application.routes.draw do
  get 'user_book/show'
  devise_for :users

  resources :user_book
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
