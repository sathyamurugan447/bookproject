class Note < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many :reviews
	has_attached_file :note_img, :styles => { :note_index =>"250x350>", :note_show => "325x475>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :note_img, :content_type => /\Aimage\/.*\z/
end
