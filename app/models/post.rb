class Post < ActiveRecord::Base
  attr_accessible :content, :title, :user_id, :tag_list
  
  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true
  
  
  has_many :comment
  has_many :taggings
  has_many :hash_ts, through: :taggings
  belongs_to :user
 
  def self.tagged_with(tag)
    HashT.find_by_tag!(tag).posts
  end

  def self.tag_counts
    HashT.select("hash_ts.*, count(taggings.hash_t_id) as count").
      joins(:taggings).group("taggings.hash_t_id")
  end

  def tag_list
    hash_ts.map(&:tag).join(", ")
  end

  def tag_list=(tags)
    self.hash_ts = tags.split(",").map do |n|
      HashT.where(tag: n.strip).first_or_create!
    end
  end

  def self.search(search)
  if search
    where 'title LIKE ?', "%#{search}%"
  else
    scoped
  end
end

end
