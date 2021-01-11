Rails.application.routes.draw do
  devise_for :users

  root controller: :rooms, action: :index

  resources :room_messages
  resources :rooms

  resources :conversations, only: :index
  resources :conv_messages, only: [:index, :create]

  get '/load/conversation/:user_id' => 'conversations#show', as: :load_conversation
end
