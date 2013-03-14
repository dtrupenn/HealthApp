class HashT < ActiveRecord::Base
  attr_accessible :post_id, :tag

  has_many :taggings
  has_many :posts, through: :taggings
end
