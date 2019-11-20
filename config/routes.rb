# frozen_string_literal: true

# == Route Map
#
#         Prefix Verb   URI Pattern                    Controller#Action
#     encadrants GET    /encadrants(.:format)          encadrants#index
#                POST   /encadrants(.:format)          encadrants#create
#  new_encadrant GET    /encadrants/new(.:format)      encadrants#new
# edit_encadrant GET    /encadrants/:id/edit(.:format) encadrants#edit
#      encadrant PATCH  /encadrants/:id(.:format)      encadrants#update
#                PUT    /encadrants/:id(.:format)      encadrants#update
#                DELETE /encadrants/:id(.:format)      encadrants#destroy
#        enfants GET    /enfants(.:format)             enfants#index
#                POST   /enfants(.:format)             enfants#create
#     new_enfant GET    /enfants/new(.:format)         enfants#new
#    edit_enfant GET    /enfants/:id/edit(.:format)    enfants#edit
#         enfant PATCH  /enfants/:id(.:format)         enfants#update
#                PUT    /enfants/:id(.:format)         enfants#update
#                DELETE /enfants/:id(.:format)         enfants#destroy
#   inscriptions POST   /inscriptions(.:format)        inscriptions#create
#    inscription DELETE /inscriptions/:id(.:format)    inscriptions#destroy
#           dice GET    /dice(.:format)                home#dice
#           root GET    /                              home#index

Rails.application.routes.draw do
  # For details on the DSL : https://guides.rubyonrails.org/routing.html
  resources :encadrants, except: [:show], constraints: { format: :html }
  resources :enfants,    except: [:show], constraints: { format: :html }
  resources :inscriptions, only: %i[create destroy]

  get "dice", to: "home#dice"
  root "home#index"
end
