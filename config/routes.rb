Rails.application.routes.draw do
  
  
  resources :questions
  resources :advertisements
  
  resources :topics do
 
     resources :posts, except: [:index]
   end
   
  resources :posts, only: [] do
 
  resources :comments, only: [:create, :destroy]
  end
  
  resources :topics do
 
  resources :sponsored_posts, except: [:index]
  end
  
  resources :users, only: [:new, :create]
  
  resources :sessions, only: [:new, :create, :destroy]
  
  post 'users/confirm' => 'users#confirm'
  
  get 'about' => 'welcome#about'
  get 'welcome/contact'
  
  get 'welcome/faq'

  root 'welcome#index'
end
