class AddAttachmentNoteImgToNotes < ActiveRecord::Migration[6.0]
  def self.up
    change_table :notes do |t|
      t.attachment :note_img
    end
  end

  def self.down
    remove_attachment :notes, :note_img
  end
end
