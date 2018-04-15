class Product < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :category
  belongs_to :manufacturer

  validates :external_id, uniqueness: true
  validates :name, length: { minimum: 3, maximum: 100 }
  validates :manufacturer_code, length: { minimum: 3, maximum: 100 },
                                allow_nil: true
  validates :ean, length: { minimum: 3, maximum: 100 },
                  allow_nil: true
  validates :price, presence: true,
                    numericality: { greater_than: 0 }

  index_name "products-#{Rails.env}"
  self.per_page = 10

  def as_indexed_json(options={})
    as_json(
      only: ['name', 'manufacturer_code', 'ean', 'price'],
      include: { category: { methods: 'path_names', only: 'path_names' },
                 manufacturer: { only: 'name' } }
    )
  end
end
