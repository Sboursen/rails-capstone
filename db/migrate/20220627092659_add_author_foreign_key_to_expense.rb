class AddAuthorForeignKeyToExpense < ActiveRecord::Migration[7.0]
  def change
    add_reference :expenses, :author, foreign_key: { to_table: :users }, index: true
  end
end
