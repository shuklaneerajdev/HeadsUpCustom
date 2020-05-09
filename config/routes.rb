Rails.application.routes.draw do
  get 'home/default'
  root "home#default"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
