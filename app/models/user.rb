class User < ApplicationRecord
  # gives User model authentication methods via bcrypt
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: { minimum: 4 }
  validates :email, uniqueness: { case_sensitive: false }, presence: true
  before_save :format_email
  # using bang method here is acceptable as the validator above ensures email is set
  # in case where email is not set, bang method will return an error

  def self.authenticate_with_credentials(email, password)
    if email
      email.downcase! 
      email.strip!
    end

    user = User.find_by_email(email)

    if user && user.authenticate(password)
      user
    else
      nil
    end

  end

  private

  def format_email
    email.strip!
    email.downcase!
  end

end
