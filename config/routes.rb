Rails.application.routes.draw do
  get 'request/create'

  get 'posts/index'
  get 'posts/new'
  post 'posts/create'
  get 'posts/request_index' => 'posts/request_index'
  get 'posts/:id' => 'posts#show'
  get 'posts/:id/edit' => 'posts#edit'
  post 'posts/:id/update' => 'posts#update'
  post 'posts/:id/destroy' => 'posts#destroy'
  get 'posts/:id/request_form' => 'request#form'
  post 'posts/:id/send_request' => 'request#create'


  get 'users/show'
  get 'users/index'

  root 'home#top'

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
