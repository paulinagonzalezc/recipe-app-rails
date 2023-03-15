Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes do
    resources :recipe_foods, as: 'foods'
  end

  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    resources :recipe_foods, only: [:new, :create, :destroy]
  end
  
  post 'recipes/:id/toggle', to: 'recipes#toggle', as: :toggle_recipe


  # Defines the root path route ("/")
  root "foods#index"
end
