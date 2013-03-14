class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :name, :gender, :age, :race, :admin, :dage, :cage, :education, :relation,
                  :location, :living, :locCare, :locCareDist, :nurseDeg, :nurseExp, :cancerType

  before_save { |user| user.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
         format: { with: VALID_EMAIL_REGEX },
         uniqueness: { case_sensitive: false }
  validates :race, presence: true
  validates :gender, presence: true
  #validates :age, presence: true
  validates_length_of :name, maximum: 70, allow_blank: true
  
  has_and_belongs_to_many :roles
  has_many :posts
  has_many :stats
  
  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end
  
  def admin?
    self.admin == 1
  end

  def male?
    self.gender == 1
  end

end
