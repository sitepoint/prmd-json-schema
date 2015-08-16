class Encryptor
  include BCrypt

  TOKEN_KEY = Rails.application.secrets.secret_key_base
  TOKEN_HASH = "SHA512"
  private_constant :TOKEN_KEY

  def self.digest_password(password, salt)
    Engine.hash_secret(password, salt)
  end

  def self.generate_salt
    Engine.generate_salt
  end

  def self.passwords_match?(password, salt, encrypted_password)
    digest_password(password, salt).to_s == encrypted_password.to_s
  end
end
