Rails.application.routes.draw do
  get 'reports/index'
  get 'reports/report_by_category'
  get 'reports/report_by_dates'
  get 'reports/report_by_types'
  get 'main/index'


  
#  resources :types do
#    resources :operations
#  end
resources :categories do
  resources :operations
end
  resources :operations
  resources :types
  resources :categories

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
