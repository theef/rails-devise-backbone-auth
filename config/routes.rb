ExampleProfile::Application.routes.draw do
  
  devise_for :users
  
  match 'current_user', :to => 'current_user#current_user'

  root :to => 'pages#index'

end
