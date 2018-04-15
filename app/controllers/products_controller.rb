class ProductsController < ApplicationController
  def index
    if params[:search].present?
      @products = Product.search(params[:search])
    else
      @products = Product.all.includes(:category, :manufacturer)
    end
  end
end
