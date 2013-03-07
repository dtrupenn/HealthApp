class Post < ActiveRecord::Base
  attr_accessible :content, :title, :user_id
  
  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true
  
  #Scopes
  scope :last_ten, order('created_at desc').limit(10);
  scope :latest, order('created_at desc').limit(1);
  
  has_many :comment
  belongs_to :user
end
