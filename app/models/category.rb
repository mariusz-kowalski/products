class Category < ApplicationRecord
  belongs_to :parent, class_name: 'Category', required: false
  has_many :children, class_name: 'Category', foreign_key: 'parent_id'

  validates :name, presence: true,
                   uniqueness: { scope: :parent },
                   length: { minimum: 3, maximum: 100 }
end
