class CatBreed < ActiveRecord::Base
  belongs_to :cat
  belongs_to :breed
end
