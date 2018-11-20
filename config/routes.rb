Rails.application.routes.draw do
  get 'welcome/index'

  resource :email_batch
  
  root 'welcome#index'
end
