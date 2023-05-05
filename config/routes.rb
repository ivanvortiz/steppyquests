Rails.application.routes.draw do
  
  resources :quests do
    resources :scenes do
      resources :steps 
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
