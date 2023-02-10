Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # OCR関連
  resources :documents do
    get 'texts', to: 'documents#execute_ocr'
    get 'vision_texts', to: 'documents#execute_vision_api'
  end


  root to: 'documents#index'

  # ログイン関連
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
