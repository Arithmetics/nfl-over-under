Rails.application.routes.draw do



  get 'standings/index'

  get 'standings/show'

  get 'password_resets/new'

  get 'password_resets/edit'

  #sets the root page of the application to go to the static_pages controller and do the home action
  root 'static_pages#home'

  #format: action(get) the url_path('/signup'), to: the controller(users) # and the action in the controller(new)
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/graphs', to: 'static_pages#graphs'
  get '/signup', to: 'users#new'
  #this one make sure a redirect for a bad form goes to /signup not /users (just asthetic)
  post '/signup', to: 'users#create'

  #we only need these for session so we dont use the full resources tag
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'




  #this adds ALL of the actions (index, show, new, create, etc. ) and
  #some named routes for user URLs. (in terms of a routes, still need the action
  #in the controller
  resources :users do
    resources :picks
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :bets do
    collection do
      put :toggle_lock
    end
  end
  resources :picks
  resources :standings



end
