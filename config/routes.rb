Rails.application.routes.draw do
  devise_for :users
  root "messages#index"
  post "multi_sms", to: 'users#multi_sms'
  resources :messages, :only => [:index, :new, :create, :show]
  resources :users do
    resources :contacts do
      resources :messages
    end
  end
end
