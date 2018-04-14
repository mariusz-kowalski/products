require 'csv'

class CSVImport
  def initialize(file_path)
    @file_path = file_path
  end

  def start
    CSV.foreach(@file_path, headers: true) do |row|
      import row
    end
  end

  private

  def import(row)
    ActiveRecord::Base.transaction do
      record = CSVSourceOne.new(row)
      product_attributes = record.fetch_product
      category_branch = record.fetch_category
      manufacturer_name = record.fetch_manufacturer
      category = Category.find_or_create_with_parents!(category_branch)
      manufacturer = Manufacturer.find_or_create_by!(name: manufacturer_name)
      Product.create!(
        product_attributes.merge(category: category, manufacturer: manufacturer)
      )
    end
  rescue ActiveRecord::ActiveRecordError => e
    message = "Can't import row (#{row}), message: #{e.message}"
    Rails.logger.error message
    STDERR.puts message
  end
end
