require 'rails_helper'


describe HomeController, :type => :feature do

  describe "GET 'index'" do
    it "to home page"  do
      visit "/"
      expect(page).to have_content("商店")
    end
  end
end
