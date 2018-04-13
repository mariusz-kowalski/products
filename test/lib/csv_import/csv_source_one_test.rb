require 'test_helper.rb'

class CSVSourceOneTest < ActiveSupport::TestCase
  def setup
    @record = CSVSourceOne.new(
      'Kategoria'      => 'Watches  > Unisex',
      'id'             => '111',
      'nazwa'          => 'Originals Adidas Adp3277',
      'producent'      => 'Adidas',
      'kod_producenta' => '123',
      'ean'            => 'abc',
      'cena'           => '505'
    )
  end

  def test_fetch_product
    expected = {
      external_id:       '111',
      name:              'Originals Adidas Adp3277',
      manufacturer_code: '123',
      ean:               'abc',
      price:             '505'
    }
    assert_equal expected, @record.fetch_product
  end

  def test_fetch_category
    assert_equal %w[Watches Unisex], @record.fetch_category
  end

  def test_fetch_manufaturer
    assert_equal 'Adidas', @record.fetch_manufacturer
  end
end
