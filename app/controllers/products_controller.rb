class ProductsController < ApplicationController
  def index
    @products = @bsale_service.list_products
    render json: @products
  end

  def filter_products
    @id = params[:category_id]
    @products = @bsale_service.filter_products(@id)
    render json: @products
  end
end
