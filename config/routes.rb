Rails.application.routes.draw do
  namespace :admin do
    root to: "homes#top"
    resources :items,         only: [:new, :create, :index, :show, :edit, :update]
    resources :genres,        only: [:create, :index, :edit, :update]
    resources :customers,     only: [:index, :show, :edit, :update]
    resources :orders,        only: [:show, :update]
    resources :order_details, only: [:update]
  end
  namespace :public do
    root to: "homes#top"
    get 'about' => 'homes#about'
    resources :items,     only: [:index, :show]
    resources :customers, only: [:show, :edit, :update] do
        collection do
            get 'unsubscribe'
        end
        collection do
            patch 'withdraw'
        end
    end
    resources :cart_items,only: [:create, :index, :destroy, :update] do
        collection do
            delete 'destroy_all'
        end
    end
    resources :orders,    only: [:new, :create, :index, :show,] do
        collection do
            post 'confirm'
        end
        collection do
            get 'complete'
        end
    end
    resources :address,   only: [:create, :index, :destroy, :edit, :update]
  end

 # 顧客用
 # URL /customers/sign_in ...
 devise_for :customers,skip: [:passwords],controllers:{
  registrations: "public/registrations",
  sessions: 'public/sessions'
 }

 # 管理者用
 # URL /admin/sign_in ...
 devise_for :admin,skip: [:registrations, :passwords],controllers:{
  sessions: "admin/sessions"
 }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
