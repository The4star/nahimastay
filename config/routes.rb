Rails.application.routes.draw do
  resources :guestreviews
  resources :accommodationreviews
  resources :stays 
  resources :messages, only: [:create, :destroy]
  resources :accommodations
  resources :profiles
  devise_for :users
  resources :charges
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "pages#index"

  get "guest/:guest_id/stays" => "stays#index", as: "guest_stays"
  get "accommodation/:accommodation_id/stays" => "stays#index", as: "accommodation_stays"
  get "pages/about" => "pages#about", as: "about_page"
  get "pages/upgrade" => "pages#upgrade", as: "upgrade"
  get "stay/update-status" => "stays#update_status", as: "update_status"
end
