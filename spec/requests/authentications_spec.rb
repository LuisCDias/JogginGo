require 'spec_helper'

describe "Authentications" do

	subject {page}
	
	before do
		visit signin_path
	end

	it "should have title" do
		should have_selector('title', text: 'Signin')
	end

	it "should have h1" do
		should have_selector('h1', text: 'Please sign in!')
	end

	describe 'with invalid input' do

		before do
			click_button "Sign in"
		end

		it "should render the same page" do
			should have_selector('title',
				:text => "Signin")
		end

		it "should show errors" do
			should have_selector('div.alert.alert-error',
				:text => "Invalid email/password combination")
		end
	end
end
