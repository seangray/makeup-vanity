Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #home route should be products
  root 'products#index'

  #have additional routes for the state machine transitions
  resources :products do
    get :open
    get :finish
    get :destash
    collection do
      get 'gone'
    end
  end

end
