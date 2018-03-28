Rails.application.routes.draw do


  root 'home#index', as: 'home'
  get 'welcome' => 'welcome#index', as: 'welcome'
  devise_for :users, controllers: {registrations: "registrations"}
  # get 'categories' => 'categories#index', as: 'category'
  # get 'categories' => 'categories#index', as: 'categories'
  # get '/categories/:category_id', to:  'questions#new#'
  # get 'question' => 'questions#index' , as: 'question'
  # get 'answer' => 'answer#index', as: 'answer'
  # resource :questions
  #
  #     resources :categories
resources :categories
      resources :questions do
        resources :answers
      end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
