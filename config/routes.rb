Rails.application.routes.draw do
  
  devise_for :users, controllers: { registrations: 'registrations' }

  root to: "excursions#index"
  post '/offers/user/:user_id/excursion/:excursion_id' => 'offers#new_create'
  get '/offers/guide/:excursion_id' => 'offers#new_direct'
  get  '/offers/new_admin', to: 'offers#new_admin', as:"new_offer_admin"
  resources :offers  

  resources :monuments

  resources :guides do
    resources :offers, only: [:new, :create, :edit, :update]
  end

  resources :tours do
    resources :excursions, only: [:new, :create, :edit, :update, :show]
  end
  
  get  '/excursions/all' =>  'excursions#all'
  resources :excursions do
    resources :offers, only: [:new, :create, :edit, :update] do 
      resource :tours
    end
  end


  resources :tourists do
    resources :tours, only: [:index, :new, :create]
  end
  

  get "/excursions/:excursion_id/guides/:guide_id/tours_opinion", to: "tours#opinion", as: "excursions_guide_tours_opinion"
  get "/tourist/tour/show_excursion_tourist", to: "tours#show_tourist_tour", as: "tourist_tour_show"
  
  get "/excursions_date/:excursion_id", to: "excursions#exc_date", as:"excursions_date"  
  post '/excursions/date', to: 'excursions#show_query'  
  post '/guide/myshow/:guide_id' => 'guide#show_guide'
  
  
  get  '/offers/new/:user_id' => 'offers#new'


  get "/excursion_admin", to: "excursions#index_admin", as: "excursions_admin"
  get "/guide_admin", to: "guides#index_admin", as: "guides_admin"


end
