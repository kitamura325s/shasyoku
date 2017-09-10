module PicturesHelper
  def picture_img(picture)
    return image_tag(picture.image) if picture.image?
  end
end
