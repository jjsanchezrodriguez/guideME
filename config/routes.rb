Rails.application.routes.draw do

  resources :guides do
      resources :offers, only:[:index]
  end

  resources :excursions  do
      resources :offers, only:[:index]
  end

  resources :guides, only:[]  do
    resources :excusions, only:[]  do
      resources :offers
    end  
  end

  # resources :tourist  do
  #   resources :excursions
  #   resources :guides
  #   resources :tours
  # end

end
