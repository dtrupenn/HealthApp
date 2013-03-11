class Stat < ActiveRecord::Base

  attr_accessible :stat_type, :user_id, :value
  
  validates :user_id, presence: true
  validates :stat_type, presence: true
  validates :value, presence: true
  
  belongs_to :user
end
