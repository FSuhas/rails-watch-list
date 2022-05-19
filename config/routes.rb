Rails.application.routes.draw do
  resources :lists do
    resources :bookmarks, only: %i( create new )
  end
  resources :bookmarks, only: %i( destroy )
end
