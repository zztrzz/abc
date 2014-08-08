class Photo < ActiveRecord::Base

 
has_many :answers

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

	accepts_nested_attributes_for :answers 

def image_show
	ActionController::Base.helpers.image_tag self.image.url(:thumb)

end
end