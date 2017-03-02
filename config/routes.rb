Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "mountains#index"
  # Routes for the Comment resource:
  # CREATE
  get "/comments/new", :controller => "comments", :action => "new"
  post "/create_comment", :controller => "comments", :action => "create"

  # READ
  get "/comments", :controller => "comments", :action => "index"
  get "/comments/:id", :controller => "comments", :action => "show"

  # UPDATE
  get "/comments/:id/edit", :controller => "comments", :action => "edit"
  post "/update_comment/:id", :controller => "comments", :action => "update"

  # DELETE
  get "/delete_comment/:id", :controller => "comments", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # Routes for the Photo resource:
  # CREATE
  get "/photos/new", :controller => "photos", :action => "new"
  post "/create_photo", :controller => "photos", :action => "create"

  # READ
  get "/photos", :controller => "photos", :action => "index"
  get "/photos/:id", :controller => "photos", :action => "show"

  # UPDATE
  get "/photos/:id/edit", :controller => "photos", :action => "edit"
  post "/update_photo/:id", :controller => "photos", :action => "update"

  # DELETE
  get "/delete_photo/:id", :controller => "photos", :action => "destroy"
  #------------------------------

  # Routes for the Trail resource:
  # CREATE
  get "/trails/new", :controller => "trails", :action => "new"
  post "/create_trail", :controller => "trails", :action => "create"

  # READ
  get "/trails", :controller => "trails", :action => "index"
  get "/trails/:id", :controller => "trails", :action => "show"

  # UPDATE
  get "/trails/:id/edit", :controller => "trails", :action => "edit"
  post "/update_trail/:id", :controller => "trails", :action => "update"

  # DELETE
  get "/delete_trail/:id", :controller => "trails", :action => "destroy"
  #------------------------------

  # Routes for the Mountain resource:
  # CREATE
  get "/mountains/new", :controller => "mountains", :action => "new"
  post "/create_mountain", :controller => "mountains", :action => "create"

  # READ
  get "/mountains", :controller => "mountains", :action => "index"
  get "/mountains/:id", :controller => "mountains", :action => "show"

  # UPDATE
  get "/mountains/:id/edit", :controller => "mountains", :action => "edit"
  post "/update_mountain/:id", :controller => "mountains", :action => "update"

  # DELETE
  get "/delete_mountain/:id", :controller => "mountains", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
