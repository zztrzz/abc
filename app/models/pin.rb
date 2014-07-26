class Pin < ActiveRecord::Base
 
	belongs_to :user
     has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
     validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

     has_many :answers, :dependent => :destroy 

   # searchable do
    # text :description
   # end
    
    accepts_nested_attributes_for :answers 
end
