Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root :to => "rooms#index"
    resources :rooms, only: [:index]
  end
end
