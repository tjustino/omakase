Rails.application.routes.draw do
  # For details on the DSL : https://guides.rubyonrails.org/routing.html
  # resources :inscriptions, except: [:show]
  resources :encadrants, except: [:show], constraints: { format: :html }
  resources :enfants, except: [:show], constraints: { format: :html }

  get "dice", to: "home#dice"
  root "home#index"
end
