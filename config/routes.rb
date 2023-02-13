Rails.application.routes.draw do
 root to: 'books#index'
  devise_for :users

  # ログアウト仮
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :books
end
