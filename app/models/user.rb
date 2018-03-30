class User < ActiveRecord::Base
  has_many :reviews
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false}


  def self.authenticate_with_credentials(email, password)
    email = email.gsub(/\s+/, '').downcase
    user = User.find_by_email(email)
    return user && user.authenticate(password)
  end

end