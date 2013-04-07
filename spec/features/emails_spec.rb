require 'spec_helper'

describe "Emails" do

  describe "Landing Page" do
    it "should have the content 'MailRubber'" do
      visit '/'
      page.should have_content('MailRubber')
    end

    it "should have a field for email entry" do
      visit '/'
      page.should have_content('Email')
    end
  end
end
