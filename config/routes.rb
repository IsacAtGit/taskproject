Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root "task#index"
  post "todos/create", to:"task#createtask"
  get "todos", to:"task#viewalltasks"
  get "todos/notcompleted", to:"task#notcompleted"
  get "todos/completed", to:"task#completed"
  put "todos/:id/edit", to:"task#edittask"
  get "todos/:id", to:"task#specifictask"
  delete "todos/:id/delete" ,to:"task#deletetask"
 
end
