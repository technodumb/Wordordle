Rails.application.routes.draw do
  root 'play#index'

  get 'index', to: 'play#index', as: 'index'
  get 'create', to: 'play#create', as: 'create'
  get 'generate_room', to: 'play#generate_room', as: 'generate_room'
  # get 'join', to: 'play#validate_room', as: 'join_room'
  get 'join/:roomID', to: 'play#join', as: 'join_room'
  post 'join', to: 'play#validate_room'
end
