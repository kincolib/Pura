Rails.application.routes.draw do

  resources :projects do
  	resources :documents
  	resources :memberships
  end

  resources :conversations do
    resources :messages
  end

  get 'project/:id/invite_members' => 'projects#invite_members', as: :project_invite_members
  patch 'project/:id/invite_members' => 'projects#update_members', as: :project_update_members

  post 'project/:id/memberships/update_members' => 'memberships#update_members', as: :membership_update_members

  get 'project/:id/edit_leader' => 'projects#edit_leader', as: :project_edit_leader
  patch 'project/:id/edit_leader' => 'projects#update_leader', as: :project_update_leader

  devise_for :users, controllers: {registrations: 'registrations', invitations: 'invitations'}
  get 'users/' => 'users#index'

  mount ActionCable.server => '/cable'
  

  root 'projects#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
