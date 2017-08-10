Rails.application.routes.draw do
  resources :tickers do
    member do
      post :update_price
    end
  end
end
