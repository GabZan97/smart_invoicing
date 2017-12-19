Rails.application.routes.draw do

  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/statistics', to: 'static_pages#statistics'
  get '/signup', to:'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/clients', to: 'clients#index'
  get '/client/new', to: 'clients#new'
  post '/client/new', to: 'clients#create'
  post '/invoices/pdf', to: 'invoices#pdf'
  get '/document', to: 'invoices#document'

  resources :hours
  resources :clients
  resources :invoices
  resources :users, except: [:new, :index]

  # charts
  namespace :charts do
    get 'total_hours'
    get 'total_single_invoice_amount'
    get 'total_invoices_amount_per_client'
    get 'total_invoices_amount_per_client_per_day'
    get 'total_invoices_amount_per_day_of_the_week'
    get 'total_hour_count_per_day'
    get 'total_invoices_amount_per_month'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
