class Email < ActiveRecord::Base
  attr_accessible :delete_token, :email, :get_token
end
