Rails.application.routes.draw do
  root "home#index"
  get "home/top", to: "home#top"

  # 検索機能関連
  resources :partners do
    collection do
      post :confirm
    end
  end




  # RailsAdmin関連
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :users, only: [:show, :index]

  # OCR関連
  resources :documents do
    get 'texts', to: 'documents#execute_ocr'
    get 'vision_texts', to: 'documents#execute_vision_api'
  end

  # ログイン関連
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end



