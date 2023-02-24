Rails.application.routes.draw do
  root "home#top"
  

  # 検索機能関連
  resources :partners do
    collection do
      post :confirm
    end
  end
  # get 'search', to: 'partners#search'
  # resources :costs do
  #   collection do
  #     get 'search'
  #   end
  # end


  # RailsAdmin関連
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :users, only: [:show, :index]

  devise_scope :user do
    post '/users/guest_sign_in', to: 'users/sessions#new_guest'
    post '/users/guest_admin_sign_in', to: 'users/sessions#new_guest_admin'
  end
  

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



