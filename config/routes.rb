Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  resources :interventions
  resources :quotes
  resources :leads
  resources :employees
  resources :elevators
  resources :customers
  resources :columns
  resources :buildings
  resources :building_details
  resources :batteries
  resources :addresses
  devise_for :users
  resources :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get 'quotes/request_quote'
  post '/request_quote', to: 'quotes#create'

  get 'leads/leads_quote'
  post '/leads_quote', to: 'leads#create'

  # do not change root path for the mainPage, the home page is now called "mainPage"
  root "application#mainPage"

  get 'leads/leads_quote'
  post '/leads_quote', to: 'leads#create'

  get '/map', to: 'application#factElevator'
  # get '/map', to: 'application#google_map'

  get '/mainPage', to: "application#mainPage"
  get "/request_quote_page", to: "application#request_quote_page"
  get "/residential-services", to: "application#residential-services"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
