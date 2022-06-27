class Expense < ApplicationRecord
  has_and_belongs_to_many :categories
  belongs_to :author, class_name: 'User',
                      foreign_key: 'author_id'
end
