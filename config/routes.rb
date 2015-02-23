Rails.application.routes.draw do

root 'users#index'

resources :users
resources :courses

get "signin" => "sessions#new", as: :signin
post "signin" => "sessions#create"
get "signout" => "sessions#destroy", as: :signout
get "signup" => "registrations#new", as: :signup
post "signup" => "registraions#create"

end
