Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'pages#home'
  get 'pages/home', as: 'home'
  get 'pages/tireoide', as: 'tireoide'

  post '/pages/result_tireoide', to: 'pages#result_tireoide', as: 'result_tireoide'
  
end
