Rails.application.routes.draw do
  get 'friends/index'

  root 'home#top'

  get 'posts/index'
  get 'posts/new'
  post 'posts/create'
  get 'posts/:id' => 'posts#show'
  get 'posts/:id/edit' => 'posts#edit'
  post 'posts/:id/update' => 'posts#update'
  post 'posts/:id/destroy' => 'posts#destroy'

  get 'request/create'
  get 'request/index'
  get 'request/:id/accept' => 'request#accept'
  get 'request/:id/reject' => 'request#reject'
  get 'request/:id/form' => 'request#form'
  post 'request/:id/create' => 'request#create'

  get 'users/:id/show' => 'users#show'
  get 'users/index'


  get 'notification/:id' => 'notification#show'

  get 'message/:id' => 'message#show' #id = room_id
  post 'message/:id/create' => 'message#create'

  get 'friends/:id' => 'friends#index'

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
