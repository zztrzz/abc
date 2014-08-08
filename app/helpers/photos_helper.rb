module PhotosHelper

	def image_show

  image_tag self.image.url(:thumb)

  end 

end
