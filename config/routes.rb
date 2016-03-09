Rails.application.routes.draw do
  
  root to: "excursions#index"

  resources :offers
  resources :guides do
    resources :offers, only: [:new, :create, :edit, :update]
  end

  resources :excursions 

  post '/excursions/date' => 'excursions#index'
  get  '/offers/new/:guide_id' => 'offers#new'
  post '/offers' => 'offers#create'

end
