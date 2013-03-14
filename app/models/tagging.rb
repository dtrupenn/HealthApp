class Tagging < ActiveRecord::Base
  belongs_to :hash_t
  belongs_to :post
  # attr_accessible :title, :body
end
