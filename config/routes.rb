Rails.application.routes.draw do
  resources :tweets

  resources :tweets do
    collection do
      post :confirm
    end
  end
end
