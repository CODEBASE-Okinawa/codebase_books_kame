Rails.application.routes.draw do
  # development環境ではメールを送信する代わりに、指定のブラウザでプレビュー
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  get 'reservations/reserve'
  get 'reservations/show'
 root to: 'books#index'
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  resources :books
  resources :reservations
  resources :lendings
end
