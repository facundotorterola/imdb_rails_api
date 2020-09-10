Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :user , only:[:index,:show,:create,:update]
  resources :movie , only:[:index,:show,:create,:update]

  post "/movie/:id/review" ,to:'movie#create_review'
  post "/auth/login" ,to:'authentication#login'

end
