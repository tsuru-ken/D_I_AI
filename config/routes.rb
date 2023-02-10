Rails.application.routes.draw do
  resources :documents do
    get 'texts', to: 'documents#execute_ocr'
    get 'vision_texts', to: 'documents#execute_vision_api'
  end

  root to: 'documents#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
