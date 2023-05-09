class User < ApplicationRecord

  has_secure_password

  validates :first_name,:last_name, :password_confirmation, :email, presence: true
  validates :password, presence: true, length: {minimum: 8}
  validates_uniqueness_of :email, case_sensitive: false

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.downcase.strip)

    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end
end
