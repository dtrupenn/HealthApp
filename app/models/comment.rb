class Comment < ActiveRecord::Base
  attr_accessible :content, :post_id, :user_id
    
  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :content, presence: true
  
  #Scopes
  scope :last_five, order('created_at desc').limit(5)
  
  belongs_to :post
  belongs_to :user
end
