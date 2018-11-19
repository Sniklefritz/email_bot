Rails.application.routes.draw do
  get 'welcome/index'

  resources :email_batch

  root 'welcome#index'
end
