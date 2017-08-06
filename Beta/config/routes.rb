Rails.application.routes.draw do

  get 'documents/create'

  get 'documents/destroy'

  resources :projects do
  	resources :messages
  	resources :documents
  end

  devise_for :users

  root 'projects#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
