Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  resources :users
  post '/auth/login_by_email', to: 'authentication#login_by_email'
  post '/auth/login_by_otp', to: 'authentication#login_by_otp'
  post '/auth/send_otp', to: 'authentication#send_otp'

  get '/*a', to: 'application#not_found'
end
