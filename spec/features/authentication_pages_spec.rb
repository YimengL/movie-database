require 'spec_helper'

describe "Authentication" do

  describe "login page" do
    before do
      visit login_path
    end

    it { expect(page).to have_content('Log in') }
    it { expect(page).to have_title('Log in') }
  end

  describe "sign in" do
    before do
      visit login_path
    end

    describe "with invalid information" do
      before do
        click_button "Log in"
      end

      it { expect(page).to have_title('Log in') }
      it { expect(page).to have_selector('div.alert-danger') }

      describe "after visiting another page" do
        before do
          click_link "About"
          it { expect(page).not_to have_selector('div.alert-danger') }
        end
      end
    end

    describe "with valid information" do
      let!(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email", with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "Log in"
      end

      it { expect(page).to have_title(user.name) }
      it { expect(page).to have_link('Profile', href: user_path(user)) }
      it { expect(page).to have_link('Log out', href: logout_path) }
      it { expect(page).not_to have_link('Log in', href: login_path) }

      describe "followed by signout" do
        before do
          click_link "Log out"
        end
        it { expect(page).to have_link('Log in') }
      end
    end
  end

end
