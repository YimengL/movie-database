require 'spec_helper'

describe "Static Pages" do
  describe "About Page" do
    before do
      visit about_path
    end
    it "Should have the content 'About' & 'Movie Database'" do
      expect(page).to have_content('About')
      expect(page).to have_content('Movie Database')
    end

    it "Should have the title 'About'" do
      expect(page).to have_title("About | Movie Database")
    end
  end

  describe "Help Page" do
    before do
      visit help_path
    end
    it "should have the content 'Help'" do
      expect(page).to have_content('Help')
    end

    it "Should have the title 'Help'" do
      expect(page).to have_title("Help | Movie Database")
    end
  end
end
