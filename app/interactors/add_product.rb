class AddProduct
  include Interactor

  def self.call(product_attributes:, category_path:, manufacturer_name:)
    super
  end

  def call
    ActiveRecord::Base.transaction do
      category = Category.find_or_create_with_parents!(context.category_path)
      manufacturer = Manufacturer.find_or_create_by!(
        name: context.manufacturer_name
      )
      Product.create!(
        context.product_attributes
               .merge(category: category, manufacturer: manufacturer)
      )
    end
  rescue ActiveRecord::ActiveRecordError => e
    message = "Can't import product (#{context.to_h}), message: #{e.message}"
    context.fail!(message: message)
  end
end
