Rails.application.routes.draw do
  
  devise_for :users
  get 'comments/create'
  resources :posts do
    resources :comments
  end
  
  root 'posts#index'

  get '/about' => 'pages#about', as: :about

end
