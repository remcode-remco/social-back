Rails.application.routes.draw do
  resources :users
  resources :posts
  resources :replies, except: [:index]
  resources :locations, except: [:new, :edit]
  resources :keywords, except: [:new, :edit]
  resources :post_keywords, except: [:new, :edit]

end
