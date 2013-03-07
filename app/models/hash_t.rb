class HashT < ActiveRecord::Base
  attr_accessible :post_id, :tag

  validates :post_id, presence: true
  validates :tag, presence: true

  belongs_to :post
end
