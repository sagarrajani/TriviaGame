Rails.application.routes.draw do


  get 'users/index'

  root 'welcomes#index', as: 'home'
  get 'welcome' => 'welcomes#index', as: 'welcome'
  devise_for :users, controllers: {registrations: "registrations"}
  # get 'categories' => 'categories#index', as: 'category'
  # get 'categories' => 'categories#index', as: 'categories'
  # get '/categories/:category_id', to:  'questions#new#'
  # get 'question' => 'myquestions#my_index' , as: 'my_question'
  # get 'question/:id/' => 'myquestions#my_show' , as: 'show_my_question'
  # delete 'question.:id/',to: 'myquestions#destroy', as: 'delete_my_question'
  # get 'questions/:id/edit', to: 'myquestions#edit', as: 'edit_my_questions'
  # get 'questions/:id/answer', to: 'questions#answer', as: 'ganswer'
  post 'questions/:id/answer', to: 'questions#answer', as: 'answer'
  patch 'myquestions/:id/edit', to: 'myquestions#update'
  get 'tags/:tag', to: 'tags#question', as: 'tag'
  get 'tags/:name/tagquestions/:id', to: 'tags#show', as: 'tag_show'
  post 'tags/:name/tagquestions/:id/answer', to: 'tags#answer', as: 'tag_answer'
  get 'users/score', to: 'users#score', as: 'score'

  # get 'round', to: 'questions#round_index', as: 'round_index'
  # get 'round/:id', to: 'questions#round', as: 'round'

  # match '/users',   to: 'users#index',   via: 'get'
  # match '/user/:id', to: 'users#show',       via: 'get'
  # get 'answer' => 'answer#index', as: 'answer'
  # resource :questions
  #
      # resources :round
  resources :questions do
    member { post :vote }
  end
  resources :tags
  resources :myquestions
  resources :rounds
  # post 'myquestions', to: 'myquestions#create'
  # resources :users, except: [:new,:create]
    # resources :categories, except: [:destroy]
# resources :categories
#       resources :questions do
#         resources :answers
#       end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
