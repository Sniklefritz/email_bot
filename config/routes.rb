Rails.application.routes.draw do
  get 'email/index'
  get 'email/import'
  get 'welcome/index'

  resources :email_batches
  resources :email do
    collection { post :import }
  end

  root 'welcome#index'

end
