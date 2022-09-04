class ProductsController < ApplicationController
  def index
    @products = @bsale_service.list_products
    render json: @products
  end
end
