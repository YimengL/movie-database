require 'spec_helper'

describe "User pages" do
  describe "signup page" do
    before do
      visit signup_path
    end

    it "'Sign up' in the page" do
      expect(page).to have_content('Sign up')
    end

    it "Sign up title" do
      expect(page).to have_title('Sign up | Movie Database')
    end
  end

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      visit user_path(user)
    end

    it { expect(page).to have_title(user.name) }
    it { expect(page).to have_content(user.name) }
  end

  describe "sign up" do
    before do
      visit signup_path
    end

    let(:submit) { "Create my account" }
    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name", with: "Example User"
        fill_in "Email", with: "user@example.com"
        fill_in "Password", with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end

end
