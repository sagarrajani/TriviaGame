Rails.application.routes.draw do


  get 'users/index'

  root 'home#index', as: 'home'
  get 'welcome' => 'welcome#index', as: 'welcome'
  devise_for :users, controllers: {registrations: "registrations"}
  # get 'categories' => 'categories#index', as: 'category'
  # get 'categories' => 'categories#index', as: 'categories'
  # get '/categories/:category_id', to:  'questions#new#'
  get 'question' => 'questions#myindex' , as: 'myquestion'
  get 'question/:id/' => 'questions#myshow' , as: 'showmyquestion'
  delete 'question/:id/',to: 'questions#destroy', as: 'deletemyquestion'
  get 'questions/:id/edit', to: 'questions#edit', as: 'edit_myquestions'
  get 'questions/:id/answer', to: 'questions#answer', as: 'ganswer'
  post 'questions/:id/answer', to: 'questions#answer', as: 'answer'
  patch 'questions/:id/edit', to: 'questions#update'
  get 'tags/:tag', to: 'questions#tagindex', as: 'tag'
  get 'tags/:name/tagquestions/:id', to: 'questions#tagshow', as: 'tagshow'
  post 'tags/:name/tagquestions/:id/answer', to: 'questions#taganswer', as: 'taganswer'
  get 'users/score', to: 'users#score', as: 'score'

  get 'round', to: 'questions#roundindex', as: 'roundindex'
  get 'round/:id', to: 'questions#round', as: 'round'

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
  # resources :users, except: [:new,:create]
    # resources :categories, except: [:destroy]
# resources :categories
#       resources :questions do
#         resources :answers
#       end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
