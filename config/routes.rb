Rails.application.routes.draw do
  root "home#index"
  get "home/top", to: "home#top"

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # OCR関連
  resources :documents do
    get 'texts', to: 'documents#execute_ocr'
    get 'vision_texts', to: 'documents#execute_vision_api'
  end


  # root to: 'documents#index'

  # ログイン関連
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :users, only: %i[show]
end
