Rails.application.routes.draw do
  # For details on the DSL : https://guides.rubyonrails.org/routing.html
  # resources :inscriptions, except: [:show]
  resources :encadrants, except: [:show]
  resources :enfants, except: [:show]

  get "dice", to: "home#dice"
  root "home#index"
end
