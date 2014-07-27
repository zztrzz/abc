class Topic < ActiveRecord::Base
	acts_as_followable
	belongs_to :answer 
	 
end
