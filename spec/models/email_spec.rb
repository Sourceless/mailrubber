require 'spec_helper'

describe Email do

  before { @email = Email.new(:email => "test@test.com",
                              :get_token => "testtoken",
                              :delete_token => "testtoken") }

  subject { @email }

  it { should respond_to(:email) }
  it { should respond_to(:get_token) }
  it { should respond_to(:delete_token) }

  it { should be_valid }

  describe "when email is not present" do
    it { should_not be_valid }
  end
end
