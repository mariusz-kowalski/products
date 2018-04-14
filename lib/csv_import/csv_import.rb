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
    record = CSVSourceOne.new(row)
    result = AddProduct.call(product_attributes: record.fetch_product,
                             category_branch: record.fetch_category,
                             manufacturer_name: record.fetch_manufacturer)
    if result.failure?
      Rails.logger.error result.message
      STDERR.puts result.message
    end
  end
end
