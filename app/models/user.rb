class User < ApplicationRecord
  # gives User model authentication methods via bcrypt
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: { minimum: 4 }
  validates :email, uniqueness: { case_sensitive: false }, presence: true
  before_save { email.downcase! }
  # using bang method here is acceptable as the validator above ensures email is set
  # in case where email is not set, .downcase! will return an error

end
