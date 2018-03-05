Rails.application.routes.draw do
  resources :announcements
  devise_for :users
  resources :proposals
  resources :reviews
  resources :comments

  root :to => 'landing_page#index'
  post '/' => 'landing_page#index', as:'home_page'
  get '/proposals' => 'proposals#index', as:'proposals_page'
  get '/proposals/:id/veto' => 'proposals#veto', as: 'veto'
  get '/proposals/:id/assign' => 'proposals#assign', as: 'assign_proposal'
  post '/proposals/:id/assignhead/:memberid' => 'proposals#assign_head_to_proposal', as: 'assign_head_to_proposal'
  post '/proposals/:id/assignmember/:memberid' => 'proposals#assign_member_to_proposal', as: 'assign_member_to_proposal'
  post '/proposals/:id/removehead/:memberid' => 'proposals#remove_head_from_proposal', as: 'remove_head_from_proposal'
  post '/proposals/:id/removemember/:memberid' => 'proposals#remove_member_from_proposal', as: 'remove_member_from_proposal'
  get '/proposals/:id/editsubmissionperiod' => 'proposals#edit_submission_period', as: 'edit_submission_period'
  post '/proposals/:id/editsubmissionperiod' => 'proposals#edit_period', as: 'edit_period'
  get '/under_construction', to: "landing_page#under_construction", as: "under_construction"
  get 'proposals/:id/reviews' => 'reviews#index', as: 'reviews_page'
  post 'proposals/:id/reviews' => 'reviews#add_comment', as:"add_comment"
  get '/assign' => 'users#index', as: 'assign_account'
  get '/user/:id' => 'users#view', as: 'view_user'
  get '/remove/:id' => 'users#edit', as: 'edit_account'
  post '/add/:id/researcher' => 'users#add_researcher', as: 'add_researcher'
  post '/add/:id/dean' => 'users#add_dean', as: 'add_dean'
  post '/add/:id/member' => 'users#add_committee_member', as: 'add_committee_member'
  post '/add/:id/head' => 'users#add_committee_head', as: 'add_committee_head'
  post '/add/:id/admin' => 'users#add_admin', as: 'add_admin'

  post '/remove/:id/researcher' => 'users#remove_researcher', as: 'remove_researcher'
  post '/remove/:id/dean' => 'users#remove_dean', as: 'remove_dean'
  post '/remove/:id/member' => 'users#remove_committee_member', as: 'remove_committee_member'
  post '/remove/:id/head' => 'users#remove_committee_head', as: 'remove_committee_head'
  post '/remove/:id/admin' => 'users#remove_admin', as: 'remove_admin'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
