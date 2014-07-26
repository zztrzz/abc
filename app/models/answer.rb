class Answer < ActiveRecord::Base
	belongs_to :pin 
	belongs_to :doctor 

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
