class Category < ApplicationRecord
  belongs_to :parent, class_name: 'Category'
  has_many :children, class_name: 'Category', foreign_key: 'parent_id'

  validates :name, presence: true
  validates :name, uniqueness: { scope: :parent }
end
