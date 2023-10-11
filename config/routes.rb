Rails.application.routes.draw do
  # Defines the root path route ("/")
  # root "articles#index"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # root "delivery#index"
  get("/", { :controller => "packages", :action => "index" })

  # Routes for the Package resource:

  # CREATE
  post("/insert_package", { :controller => "packages", :action => "create" })
          
  # READ
  get("/packages", { :controller => "packages", :action => "index" })
  
  get("/packages/:path_id", { :controller => "packages", :action => "show" })
  
  # UPDATE
  
  post("/modify_package/:path_id", { :controller => "packages", :action => "update" })
  
  # DELETE
  get("/delete_package/:path_id", { :controller => "packages", :action => "destroy" })

  #------------------------------
  
end
