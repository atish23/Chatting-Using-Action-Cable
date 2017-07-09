Rails.application.routes.draw do
	mount ActionCable.server => '/cable'
	devise_for :users

  root to: "chatrooms#index"

  resources :chatrooms do
  	resource :messages
  	resource :chatroom_users
  end

end
