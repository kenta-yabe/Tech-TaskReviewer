Rails.application.routes.draw do

    root to: 'toppages#index'
    
    
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'

    
    get 'signup', to: 'users#new'
    resources :users, only: [:show, :create] do
        member do
            get :complist #完了タスク一覧ページ
            get :followings
            get :followers
        end
    end
    
    resources :purposes, only: [:show,:new,:create,:edit,:update,:destroy] do
        member do
            get :done #edit
            get :review
        end
    end
    
    
    resources :tasks, only: [:new, :create, :edit,:update, :destroy]
    
    resources :reviews, only: [:create, :edit, :update, :destroy]
    
    resources :reviewlists, only: [:index]
    resources :relationships, only: [:create, :destroy]
    
end
