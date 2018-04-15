class ProductsController < ApplicationController
  def index
    if params[:search].present?
      @products = search
    else
      @products = all
    end
  end

  private

  def search
    Product.search(params[:search])
           .paginate(page: params[:page])
  end

  def all
    Product.all
           .includes(:category, :manufacturer)
           .paginate(page: params[:page])
  end
end
