class Answer < ActiveRecord::Base
	belongs_to :pin 
	belongs_to :doctor 
	acts_as_likeable;

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
end
