Rails.application.routes.draw do
  get 'welcome/index'

  resources :email_batches

  root 'welcome#index'

end
