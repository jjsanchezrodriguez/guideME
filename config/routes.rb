Rails.application.routes.draw do
  
  devise_for :users, controllers: { registrations: 'registrations' }

  root to: "excursions#index"
  post '/offers/user/:user_id/excursion/:excursion_id' => 'offers#new_create'
  get '/offers/guide/:excursion_id' => 'offers#new_direct'
 
  resources :offers
  resources :guides do
    resources :offers, only: [:new, :create, :edit, :update]
  end
  
  get  '/excursions/all' =>  'excursions#all'
  resources :excursions 


  resources :tourists do
    resources :tours, only: [:index, :new, :create]
  end

  #   resources :tourists do
  #   resources :guides, only: [:index,:new] do
  #     resources :excursions, only:[:index,:new]do
  #       resources :tours, only: [:index, :new, :create, :edit, :update]
  #     end  
  #   end    
  # end
  
  post '/excursions/date' => 'excursions#show_query'
  
  get  '/offers/new/:user_id' => 'offers#new'
 

  

  
 # get '/patients/:id', to: 'patients#show', as: 'patient'


end
