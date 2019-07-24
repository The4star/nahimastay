Rails.application.routes.draw do
  resources :guestreviews
  resources :accommodationreviews
  resources :messages
  resources :stays
  resources :accommodations
  resources :profiles
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#index'

  get 'guest/:guest_id/stays' => 'stays#index', as: 'guest_stays'

  get 'guest/:guest_id/stay/:id' => 'stays#show', as: 'show_guest_stay'

  get 'pages/about' => 'pages#about', as: 'about_page'

  get 'accommodation/:accommodation_id/stays' => 'stays#index', as: 'accommodation_stays'

  get 'accommodation/:accommodation_id/stay/:id' => 'stays#show', as: 'show_accommodation_stay'



end
