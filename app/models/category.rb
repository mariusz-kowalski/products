class Category < ApplicationRecord
  belongs_to :parent, class_name: 'Category', required: false
  has_many :children, class_name: 'Category', foreign_key: 'parent_id'

  validates :name, presence: true,
                   uniqueness: { scope: :parent },
                   length: { minimum: 3, maximum: 100 }

  def self.find_or_create_with_parents!(names)
    parent = nil
    names.each do |name|
      parent = find_or_create_by!(name: name, parent: parent)
    end
    parent
  end

  def path
    steps = []
    pointer = self
    while pointer
      steps.prepend pointer
      pointer = pointer.parent
    end
    steps
  end

  def path_names
    path.map(&:name)
  end
end
