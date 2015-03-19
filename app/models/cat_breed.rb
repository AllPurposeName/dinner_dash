class CatBreed < ActiveRecord::Base
  after_create :set_cat_image

  belongs_to :cat
  belongs_to :breed

  def set_cat_image
    if !cat.image_path
      cat.update(image_path: breed.image_path)
    end
  end
end
