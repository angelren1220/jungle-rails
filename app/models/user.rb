class User < ApplicationRecord

  has_secure_password

  validates :password, presence: true, length: {minimum: 8}
  validates :first_name,:last_name, :email, :password_confirmation, presence: true
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
