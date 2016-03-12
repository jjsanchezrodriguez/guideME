Rails.application.routes.draw do
  
  root to: "excursions#index"

  resources :offers
  resources :guides do
    resources :offers, only: [:new, :create, :edit, :update]
  end

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

  post '/excursions/date' => 'excursions#index'
  get  '/offers/new/:guide_id' => 'offers#new'
  post '/offers' => 'offers#create'

end
