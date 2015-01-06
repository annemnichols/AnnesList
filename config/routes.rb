Rails.application.routes.draw do

	root 'posts#index'

  get 'about' => 'static_pages#about'

  resources :posts, only: [:index]

  devise_for :users, :controllers => {registrations: 'registrations'}

  resources :users, only: [:show, :index] do
  	resources :posts, except: [:index]
  end

end
