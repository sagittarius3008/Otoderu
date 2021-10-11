Rails.application.routes.draw do
  devise_for :orchestras, controllers: {
    sessions:      'orchestras/sessions',
    passwords:     'orchestras/passwords',
    registrations: 'orchestras/registrations'
  }

  devise_scope :orchestra do
    post 'orchestras/guest_sign_in', to: 'orchestras/sessions#guest_sign_in'
  end

  devise_for :members, controllers: {
    sessions:      'members/sessions',
    passwords:     'members/passwords',
    registrations: 'members/registrations'
  }

  devise_scope :member do
    post 'members/guest_sign_in', to: 'members/sessions#guest_sign_in'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'homes#top'

  namespace :members do
    get 'member/mypage' => 'members#mypage'
    resources :members, only:[:edit, :show, :update]
    resources :practices, only:[:show]
    resources :posts, only:[:create, :show, :update, :destroy]
    resources :attendances, only:[:index, :show, :update] do
      collection do
        get 'search'
        post 'update_all'
      end
    end
    resources :orchestras, only:[:index, :create] do
      collection do
        get 'search'
      end
    end
    resources :applies, only: [:index, :create, :destroy]
  end

  namespace :orchestras do
    resources :members, only:[:index, :update]
    resources :instruments, only:[:create, :index, :update]
    resources :practices, only:[:index, :create, :show, :edit, :update, :destroy]
    resources :applies, only: [:index]
  end
  
  get 'about' => 'homes#about'
  get '/map_request', to: 'maps#map', as: 'map_request'
  post "/receive"=>"slack#create"

end
