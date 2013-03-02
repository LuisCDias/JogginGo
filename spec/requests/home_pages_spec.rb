require 'spec_helper'

describe "HomePages" do
  
  subject {page}

  describe "navigation bar links" do
  	
  	before do
      visit root_path
  		click_link "JogginGo!"  
  	end

  	it "should have title with 'JogginGo'" do
  		should have_selector('title', text: "JogginGo!")
  	end

    describe "signing up with no information" do
      before do
        click_button "Signup!"
      end

      it "should redirect to the signup page" do
        should have_selector('title', text: "Signup")
      end
    end

    describe "signing in with no information" do
      before do
        click_button "Sign in"
      end

      it "should redirect to the signin page" do
        should have_selector('title', text: "Signin") 
      end
    end
  end
end
