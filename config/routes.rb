Rails.application.routes.draw do
  get 'purposes/show'
  get 'purposes/new'
  get 'purposes/edit'
  get 'purposes/create'
  get 'purposes/destroy'
    root to: 'toppages#index'
    
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'

    
    get 'signup', to: 'users#new'
    resources :users, only: [:show, :new, :create]
    
    resources :purposes, only: [:show,:new,:create,:edit,:destroy]
    #complete,done,purpose_reviewのrootも作成(open,checkはview必要なし)
end
