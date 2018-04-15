class ProductsController < ApplicationController
  def index
    if params[:search].present?
      search
    else
      all
    end
  end

  private

  def search
    @products = Product.search(params[:search]).paginate(page: params[:page])
  end

  def all
    @products = Product.all
                       .includes(:category, :manufacturer)
                       .paginate(page: params[:page])
  end
end
