Rails.application.routes.draw do

  root 'welcome#index'

  ['about','markets','process','contact'].each do |menu|
    get "/#{menu}" => "welcome##{menu}"
  end

  api_routes = ['courses','topics','lessons','course_registrations','site_panel','common_panel','instructor_panel','admin_panel']
  api_routes.push('demos','tasks','chat')
  api_routes.each do |apir|
    get '/'+apir+'/api' => "api##{apir}_api"
    post '/'+apir+'/api' => "#{apir}#create"
  end

  get "/test" => "welcome#test"

  post '/topic/create' => "topics#create"
  post '/courses/:course_id/topics/:topic_id/lessons/new' => "lessons#create"


  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users do
    resources :groups do
      resources :user_groups
      resources :group_registrations
    end
  end


  resources :courses do
    collection do
      get '/search' => "courses#search"
    end
    resources :topics do
      resources :lessons
    end
  end


  get "/rehearsals/all" => "rehearsals#all"
  resources :lessons, shallow: true do
    resources :explanations
    resources :prompts
    resources :models
    resources :concepts
    resources :rehearsals
  end

  resources :lessons do
    resources :practices, shallow: true do
      member do
        post :token
      end
    end
  end

  resources :demos
  resources :tasks


  # resources :models
  # resources :explanations
  # resources :practices

  # resources :group_registrations
  # resources :course_registrations
  # resources :user_groups


  # resources :course_topics
  # resources :topic_lessons

  # resources :lesson_concepts
  # resources :lesson_models
  # resources :lesson_prompts
  # resources :lesson_explanations
  # resources :lesson_rehearsals
end
