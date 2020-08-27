Rails.application.routes.draw do

    root to: 'toppages#index'
    
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'

    
    get 'signup', to: 'users#new'
    resources :users, only: [:show, :new, :create]
    
    resources :purposes, only: [:show,:new,:create,:edit,:destroy]
    #complete,done,purpose_reviewのrootも作成(open,checkはview必要なし)
    
    resources :tasks, only: [:new, :create, :edit, :destroy]
end
