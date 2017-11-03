Rails.application.routes.draw do
  
  resources :advertisements
  
  get 'about' => 'welcome#about'
  get 'welcome/contact'
  
  get 'welcome/faq'

  root 'welcome#index'
end
