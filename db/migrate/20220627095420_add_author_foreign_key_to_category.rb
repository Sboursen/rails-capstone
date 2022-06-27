class AddAuthorForeignKeyToCategory < ActiveRecord::Migration[7.0]
  def change
    add_reference :categories, :author, foreign_key: { to_table: :users }, index: true
  end
end
