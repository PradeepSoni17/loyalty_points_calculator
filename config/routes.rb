Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/process_loyalty_points/:user_id', to: 'loyalty_points#process_points'
end
