class Stat < ActiveRecord::Base

  attr_accessible :stat_type, :user_id, :value
  
  validates :user_id, presence: true
  validates :stat_type, presence: true
  validates :value, presence: true
  
  belongs_to :user

  scope :most_recent, order("created_at DESC").limit(10)
  scope :first, order("created_at ASC").limit(1)
  scope :last, order("created_at DESC").limit(1)
  scope :highest, order("stats.value DESC").limit(10)
  scope :lowest, order("stats.value ASC").limit(10)


  def bp?
  	self.stat_type == 1
  end

  def wbc?
  	self.stat_type == 2
  end

  def rbc?
  	self.stat_type == 3
  end

  def hemo?
  	self.stat_type == 4
  end

  def hema?
  	self.stat_type == 5
  end

  def plat?
  	self.stat_type == 6
  end

  def hr?
  	self.stat_type == 7
  end

  def rr?
  	self.stat_type == 8
  end

  def temp?
  	self.stat_type == 9
  end

  def sat?
  	self.stat_type == 10
  end

  def pain?
  	self.stat_type == 11
  end

  def weight?
  	self.stat_type == 12
  end

end
