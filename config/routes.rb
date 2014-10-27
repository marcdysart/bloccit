Rails.application.routes.draw do

  get 'comments/index'

  get 'comments/new'

  get 'comments/show'

  get 'comments/edit'

  get 'comments/create'

  devise_for :users
    resources :users, only: [:update]
   resources :topics do
     resources :posts, except: [:index]
     resources :posts do
       resources :comments, only: [:create]
     end
   end



  get 'about' => 'welcome#about'

    root to: 'welcome#index'
end
