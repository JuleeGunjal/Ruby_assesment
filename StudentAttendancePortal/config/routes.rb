Rails.application.routes.draw do
  get 'welcome/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'welcome#index'
  resources :teachers, :subjects, :students, :attendances
  #patch 'teachers/:id', to: 'teachers#update'
end
