Rails.application.routes.draw do
  
  root to: "excursions#index"

  resources :guides do
      resources :offers, only:[:index]
  end

  resources :excursions  do
      resources :offers, only:[:index]
  end

  resources :guides, only:[]  do
    resources :excursions, only:[]  do
      resources :offers
    end  
  end

  post '/excursions/date' =>'excursions#index'

  # resources :tourist  do
  #   resources :excursions
  #   resources :guides
  #   resources :tours
  # end

end
