Rails.application.routes.draw do

root 'courses#index'
resources :courses
get "signin" => "sessions#new", as: :signin
post "signin" => "sessions#create"
get "signout" => "sessions#destroy", as: :signout

resources :registrations, only: [:new, :create]

end
