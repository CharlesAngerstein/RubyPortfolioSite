Blog::Application.routes.draw do
  root :to => "pages#show", page: "home"
  resources :articles do
    member do
      post :notify_friend
    end
    resources :comments
  end
  resources :pages do
    collection do
      get 'pages'
    end
  end
  resources :users
  resource :session
  get '/login' => "sessions#new", :as => "login"
  get '/logout' => "sessions#destroy", :as => "logout"
  get "/pages/:page" => "pages#show"

end
