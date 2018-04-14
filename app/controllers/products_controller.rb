class ProductsController < ApplicationController
  def index
    @products = Product.all.includes(:category, :manufacturer)
  end
end
