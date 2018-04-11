class Manufacturer < ApplicationRecord
  validates :name, uniqueness: true,
                   length: { minimum: 3, maximum: 100 }
end
