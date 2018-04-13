class CSVSourceOne
  def initialize(row)
    @row = row
  end

  def fetch_product
    {
      external_id: @row['id'],
      name: @row['nazwa'],
      manufacturer_code: @row['kod_producenta'],
      ean: @row['ean'],
      price: @row['cena']
    }
  end

  def fetch_category
    @row['Kategoria'].split('>').map(&:strip)
  end

  def fetch_manufacturer
    @row['producent']
  end
end
