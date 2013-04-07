require 'spec_helper'

describe "Emails" do

  describe "Landing Page" do
    it "should have the header element 'MailRubber'" do
      visit '/'
      page.should have_selector('h1',
                                :text => 'MailRubber')
    end

    it "should have a field for email entry" do
      visit '/'
      page.should have_selector('input')
    end

    it "should have a submit button that says 'Protect!'" do
      visit '/'
      page.should have_button('Protect!')
    end
  end

end
