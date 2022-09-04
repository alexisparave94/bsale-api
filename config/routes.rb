Rails.application.routes.draw do
  get "products" => "products#index"
  get "categories" => "categories#index"
  get "search" => "products#search"

  resources :categories do
    get "products", to: "products#filter_products"
  end
end
