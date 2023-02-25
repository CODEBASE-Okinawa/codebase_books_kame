Rails.application.routes.draw do
  get 'users/index'
  get 'reservations/reserve'
  get 'reservations/show'
 root to: 'books#index'
  devise_for :users

  resources :books
  resources :reservations
  resources :lendings
end
