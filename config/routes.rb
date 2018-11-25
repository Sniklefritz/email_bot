Rails.application.routes.draw do
  resources :users
  get 'welcome/index'

  resources :email_batches

  root 'welcome#index'

end
