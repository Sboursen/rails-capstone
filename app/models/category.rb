class Category < ApplicationRecord
  has_and_belongs_to_many :expenses
  belongs_to :author, class_name: 'User',
                      foreign_key: 'author_id'

  validates :name, presence: true, length: { maximum: 250 }
  validates :icon, presence: true, length: { maximum: 500 }
end
