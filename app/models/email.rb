class Email < ActiveRecord::Base
  attr_accessible :delete_token, :email, :get_token

  validates :email, presence: true, email_format: { message: "- invalid format" }
  validates :get_token, presence:true
  validates :delete_token, presence:true
end
