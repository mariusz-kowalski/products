class Product < ApplicationRecord
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
end
