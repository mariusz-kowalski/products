require 'test_helper.rb'

class CSVImportTest < ActiveSupport::TestCase
  def test_test
    import = CSVImport.new Rails.root.join('test/fixtures/files/products.csv')
    import.start
    assert Product.joins(:manufacturer, :category)
                  .find_by(
                    name: 'Originals Adidas Adp3277',
                    price: '505',
                    external_id: 56148660,
                    manufacturer_code: '111',
                    ean: '222',
                    categories: { name: 'Watches' },
                    manufacturers: { name: 'Adidas' }
                  )
    assert Product.joins(:manufacturer, :category)
                  .find_by(
                    name: 'Adidas ADP6080',
                    price: '185',
                    external_id: 35032953,
                    manufacturer_code: '333',
                    ean: '444',
                    categories: { name: 'Zegarki' },
                    manufacturers: { name: 'Adidas' }
                  )
    assert Product.joins(:manufacturer, :category)
                  .find_by(
                    name: 'Adriatica A1127.2714CH',
                    price: '624',
                    external_id: 31598547,
                    manufacturer_code: '555',
                    ean: '666',
                    categories: { name: 'Męskie' },
                    manufacturers: { name: 'Adriatica' }
                  )
  end
end
