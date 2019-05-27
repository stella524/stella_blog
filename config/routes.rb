Rails.application.routes.draw do
  
  root "articles#index"
  get "/search" => "articles#search"
  get "/blog" => "articles#blog"
  resources :articles
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
