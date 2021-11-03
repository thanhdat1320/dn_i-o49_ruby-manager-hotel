Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root :to => "rooms#index"
    get :login, to: "sessions#new"
    post :login, to: "sessions#create"
    delete :logout, to: "sessions#destroy"
    post :sessions_update, to: "sessions#update"
    get :confirm, to: "rooms#confirm"
    resources :bookings, only: :index
    resources :rooms, only: [:index, :show]
    resources :bookings, only: %i(create index)

    namespace :admin do
        resources :bookings, only: [:index, :update]
        resources :rooms, only: :index do
          collection { 
            get :export 
            post :import 
          }
        end
    end

    namespace :staff do
      resources :bookings, only: [:index, :update]
    end
  end
end
