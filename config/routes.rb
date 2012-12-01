Blog::Application.routes.draw do

  devise_for :users

  match "feed" => "articles#read", :as => :feed, :defaults => { :format => :atom }

  match "cgu" => "info#cgu", :as => :cgu
  match "a-propos" => "info#about", :as => :about
  match "about" => redirect("a-propos")

  resources :articles do
  	resources :comments
  end

  resources :categories

  root :to => "Articles#index"
  
end
