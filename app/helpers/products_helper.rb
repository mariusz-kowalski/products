module ProductsHelper
  def category_path(path)
    path.join(' > ')
  end
end
