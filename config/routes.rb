Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :lists
  resources :works
  resources :sub_works
  resources :favorites
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
