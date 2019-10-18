Rails.application.routes.draw do
  # For details on the DSL : https://guides.rubyonrails.org/routing.html
  resources :inscriptions
  resources :encadrants
  resources :enfants

  get "dice", to: "home#dice"
  root "home#index"
end
