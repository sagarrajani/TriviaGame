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
  get 'tags/:tag', to: 'questions#index', as: :tag
  get 'users/score', to: 'users#score', as: 'score'
  # match '/users',   to: 'users#index',   via: 'get'
  # match '/user/:id', to: 'users#show',       via: 'get'
  # get 'answer' => 'answer#index', as: 'answer'
  # resource :questions
  #
  #     resources :categories
  resources :questions
  resources :tags
  # resources :users, except: [:new,:create]
    # resources :categories, except: [:destroy]
# resources :categories
#       resources :questions do
#         resources :answers
#       end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
