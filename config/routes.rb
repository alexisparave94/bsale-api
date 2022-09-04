Rails.application.routes.draw do
  root "products#index"
  get "products" => "products#index"

  resources :categories do
    get "products", to: "products#filter_products"
  end
end
