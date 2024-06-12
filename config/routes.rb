Rails.application.routes.draw do
  root 'home#index'

  get 'home/index'
  get 'create', to: 'create#index'
  get 'about', to: 'about#index'
end
