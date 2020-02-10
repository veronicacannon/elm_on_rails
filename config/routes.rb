Rails.application.routes.draw do
  resources :companies
  get '/', to: 'application#index'
end
