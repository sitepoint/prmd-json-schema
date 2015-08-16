require 'activeuuid'
class Account < ActiveRecord::Base
  include ActiveUUID::UUID
  validates :email, presence: true, uniqueness: true
  validates :password_salt, presence: true
  validates :encrypted_password, presence: true

  def password=(plain_password)
    self.password_salt = Encryptor.generate_salt
    digest = Encryptor.digest_password(plain_password, password_salt)
    self.encrypted_password = digest
  end
end
