Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
############ Sessions ############
  get '/' => 'sessions#welcome'
  get 'sessions/new'
  post 'sessions' => 'sessions#create'
  delete 'sessions' => 'sessions#destroy'

############ Users #################  
  get 'users/new'
  get 'users/:id' => 'users#show'
  get 'users/:id/edit' => 'users#edit'

  post 'users' => 'users#create'
  patch 'users/:id' => 'users#update'
  delete 'users/:id' => 'users#destroy'

########## Secrets ################### 
  get 'secrets' => 'secrets#index'
  post 'secrets' => 'secrets#create'
  delete 'secrets/:id' => 'secrets#destroy'

########## LIKES ###############
post 'likes' => 'likes#create'
end
