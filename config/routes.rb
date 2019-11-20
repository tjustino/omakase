# == Route Map
#
#         Prefix Verb   URI Pattern                    Controller#Action
#     encadrants GET    /encadrants(.:format)          encadrants#index {:format=>:html}
#                POST   /encadrants(.:format)          encadrants#create {:format=>:html}
#  new_encadrant GET    /encadrants/new(.:format)      encadrants#new {:format=>:html}
# edit_encadrant GET    /encadrants/:id/edit(.:format) encadrants#edit {:format=>:html}
#      encadrant PATCH  /encadrants/:id(.:format)      encadrants#update {:format=>:html}
#                PUT    /encadrants/:id(.:format)      encadrants#update {:format=>:html}
#                DELETE /encadrants/:id(.:format)      encadrants#destroy {:format=>:html}
#        enfants GET    /enfants(.:format)             enfants#index {:format=>:html}
#                POST   /enfants(.:format)             enfants#create {:format=>:html}
#     new_enfant GET    /enfants/new(.:format)         enfants#new {:format=>:html}
#    edit_enfant GET    /enfants/:id/edit(.:format)    enfants#edit {:format=>:html}
#         enfant PATCH  /enfants/:id(.:format)         enfants#update {:format=>:html}
#                PUT    /enfants/:id(.:format)         enfants#update {:format=>:html}
#                DELETE /enfants/:id(.:format)         enfants#destroy {:format=>:html}
#   inscriptions POST   /inscriptions(.:format)        inscriptions#create
#    inscription DELETE /inscriptions/:id(.:format)    inscriptions#destroy
#           dice GET    /dice(.:format)                home#dice
#           root GET    /                              home#index

Rails.application.routes.draw do
  # For details on the DSL : https://guides.rubyonrails.org/routing.html
  resources :encadrants,   except: [:show], constraints: { format: :html }
  resources :enfants,      except: [:show], constraints: { format: :html }
  resources :inscriptions, only:   [:create, :destroy]

  get "dice", to: "home#dice"
  root "home#index"
end
