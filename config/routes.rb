Rails.application.routes.draw do
  devise_for :orchestras, controllers: {
    sessions:      'orchestras/sessions',
    passwords:     'orchestras/passwords',
    registrations: 'orchestras/registrations'
  }

  devise_for :members, controllers: {
    sessions:      'members/sessions',
    passwords:     'members/passwords',
    registrations: 'members/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'homes#top'
  get 'homes/about' => 'homes#about'

  namespace :members do
    get 'member/mypage' => 'members#mypage'
    resources :members, only:[:edit, :show, :update]
    resources :attendances, only:[:index, :show, :update]
    resources :orchestras, only:[:index, :create]
    resources :practices, only:[:show]
  end

  namespace :orchestras do
    resources :members, only:[:index, :update]
    resources :instruments, only:[:create, :index, :update]
    resources :practices, only:[:index, :create, :show, :update, :destroy]
  end

end
