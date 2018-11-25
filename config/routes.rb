Rails.application.routes.draw do
  get 'email/index'
  get 'email/import'
  get 'welcome/index'

  resources :email_batches

  root 'welcome#index'

end
