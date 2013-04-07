class Email < ActiveRecord::Base
  attr_accessible :delete_token, :email, :get_token
  before_create :generate_tokens

  validates :email, presence: true, email_format: { message: "- invalid format" }

  private

  def generate_tokens
    self.get_token = loop do
      random_token = SecureRandom.urlsafe_base64(6)
      break random_token unless Email.where(get_token: random_token).exists?
    end
    self.delete_token = loop do
      random_token = SecureRandom.urlsafe_base64(32)
      break random_token unless Email.where(delete_token: random_token).exists?
    end
  end
end
