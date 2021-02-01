class AddCategoryIdToNotes < ActiveRecord::Migration[6.0]
  def change
    add_column :notes, :category_id, :integer
  end
end
