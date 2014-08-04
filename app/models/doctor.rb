class Doctor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
   has_many :answers , :dependent => :destroy 
         acts_as_follower
         acts_as_followable
         acts_as_liker
         acts_as_likeable 
             
    has_many :messages, :dependent => :destroy 

    has_many :pins , :dependent => :destroy 

         accepts_nested_attributes_for :answers 
end
