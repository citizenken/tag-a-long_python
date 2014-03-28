class User < ActiveRecord::Base
  has_many :events
  attr_accessor :ip_address, :lat, :lon
  
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  
  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
  validates :firstname, :presence => true
  validates :lastname, :presence => true
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => { case_sensitive: false }, :format => EMAIL_REGEX
  validates :password, :confirmation => true #password_confirmation attr
  has_secure_password
  validates_length_of :password, :in => 6..20, :on => :create
  
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end
  
  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
     
  private
  
    def create_remember_token
      self.remember_token = User.hash(User.new_remember_token)
    end
 
end
