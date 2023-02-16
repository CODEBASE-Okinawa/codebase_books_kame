Rails.application.routes.draw do
  get 'reservations/reserve'
  get 'reservations/show'
 root to: 'books#index'
  devise_for :users

  # ログアウト仮
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :books
  resources :reservations
  resources :lendings
end
