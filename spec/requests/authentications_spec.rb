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

	describe "successfully signed in" do
		
		before do
			@user = User.create!(username: "exampleuser", name: "Example User", email: "user@example.com",
				password: "foobar", password_confirmation: "foobar") 
			fill_in "session_email",    with: @user.email
			fill_in "session_password", with: @user.password
			click_button "Sign in"
		end

		describe 'trying to access signin path while logged in' do

			before do
				visit signin_path
			end

			it "should redirect to the homepage" do
				should have_selector('title',
					text: "JogginGo")
			end

			#it "should have a message" do
			#	should have_selector('div.alert.alert-info')
			#end
		end

		describe 'trying to edit another user' do

			before do
				@other_user = User.create!(username: "otheruser", name: "Other User", email: "otheruser@example.com",
					password: "foobar", password_confirmation: "foobar")	
				visit edit_user_path(@other_user)
			end	

			it "should be redirected to the root path" do
				should have_selector('title',
					text: "JogginGo")
			end
		end

		describe 'followed by signout' do

			before do
				click_link "Signout"
			end

			it "should redirect to home" do
				should have_selector('title',
					text: "JogginGo")
			end

			it "should have link to 'Sign in'" do
				should have_button('Sign in')
			end

			describe 'trying to edit users without being logged' do

				before do
					visit settings_path
				end

				it "should be instead redirected to signin" do
					should have_selector('title',
						text: "Signin")
				end

				it "should have flash warning the needed authentication" do
					should have_selector('div.alert.alert-info')
				end

				describe 'redirecting to the right page after having to login' do

					before do
						fill_in "session_email",    with: @user.email
						fill_in "session_password", with: @user.password
						click_button "Sign in"
					end

					it "should redirect the user to settings instead of profile" do
						should have_selector('title',
							text: "Settings")
					end

					describe 'and afterwards signing out and signing in again' do
						before do
							click_link "Signout"
							visit signin_path
							fill_in "session_email",    with: @user.email
							fill_in "session_password", with: @user.password
							click_button "Sign in"
						end 

						it "should redirect to profile" do
							should have_selector('title',
								text: @user.username)
						end
					end
				end
			end
		end
	end

	describe 'for non-admin users' do

		before do
			@user = User.create!(username: "user1", name: "User1", email: "user1@example.com",
				password: "foobar", password_confirmation: "foobar")
			@non_admin = User.create!(username: "nonadmin",name: "Non-admin", email: "non-admin@example.com",
				password: "foobar", password_confirmation: "foobar")
			visit signin_path
			fill_in "session_email",    with: @non_admin.email
			fill_in "session_password", with: @non_admin.password
			click_button "Sign in"
		end

		describe "should not be able do delete users even without links" do

			before do
				delete user_path(@user)
			end

			it "should be redirected to root" do
				response.should redirect_to root_path
			end
		end
	end
end
