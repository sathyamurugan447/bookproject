class AddNoteIdToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :note_id, :integer
  end
end
