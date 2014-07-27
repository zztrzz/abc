class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         has_many :pins , :dependent => :destroy 

   validates :firstname, :presence => true 
         acts_as_follower 
         acts_as_liker
         
end
