# frozen_string_literal: true

# == Route Map
#
#         Prefix Verb   URI Pattern                    Controller#Action
#        enfants GET    /enfants(.:format)             enfants#index
#                POST   /enfants(.:format)             enfants#create
#     new_enfant GET    /enfants/new(.:format)         enfants#new
#    edit_enfant GET    /enfants/:id/edit(.:format)    enfants#edit
#         enfant PATCH  /enfants/:id(.:format)         enfants#update
#                PUT    /enfants/:id(.:format)         enfants#update
#                DELETE /enfants/:id(.:format)         enfants#destroy
#     encadrants GET    /encadrants(.:format)          encadrants#index
#                POST   /encadrants(.:format)          encadrants#create
#  new_encadrant GET    /encadrants/new(.:format)      encadrants#new
# edit_encadrant GET    /encadrants/:id/edit(.:format) encadrants#edit
#      encadrant PATCH  /encadrants/:id(.:format)      encadrants#update
#                PUT    /encadrants/:id(.:format)      encadrants#update
#                DELETE /encadrants/:id(.:format)      encadrants#destroy
#   inscriptions GET    /inscriptions(.:format)        inscriptions#index
#                POST   /inscriptions(.:format)        inscriptions#create
#    inscription DELETE /inscriptions/:id(.:format)    inscriptions#destroy
#           dice GET    /dice(.:format)                inscriptions#dice
#           fill POST   /fill(.:format)                inscriptions#fill
#           root GET    /                              inscriptions#index

Rails.application.routes.draw do
  # For details on the DSL : https://guides.rubyonrails.org/routing.html
  resources :enfants,      except: [:show]
  resources :encadrants,   except: [:show]
  resources :inscriptions, only: %i[index create destroy]

  get  "dice", to: "inscriptions#dice"
  post "fill", to: "inscriptions#fill"

  root "inscriptions#index"
end
