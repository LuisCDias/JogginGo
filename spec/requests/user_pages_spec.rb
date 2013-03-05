require 'spec_helper'

describe "UserPages" do

	subject { page }

	describe 'that dont need authentication' do

		describe "New user path" do
			before { 
				visit signup_path 
			}
			
			it "should have title 'Registo'" do
				should have_selector('title',
					:text => "Signup")
			end

			it "should have h1 'Insere os teus dados'" do
				should have_selector('h1',
					:text => "Signup now!")
			end

			describe 'with invalid input' do
				
				before do
					fill_in "user_username", with: ""
					fill_in "user_name", with: ""
					fill_in "user_email", with: ""
					fill_in "user_password", with: ""
					fill_in "user_password_confirmation", with: ""
				end

				it "should not add a new user after clicking 'Registar!' " do
					expect do
						click_button "Signup!"
					end.not_to change(User, :count)
				end

				it "should send a flash message with error" do
					click_button "Signup!"
					should have_selector('div.alert.alert-error',
										 :text => "Please correct your information!")
				end
			end

			describe 'with valid input' do
				
				before do
					fill_in "user_username", with: "username"
					fill_in "user_name", with: "myname"
					fill_in "user_email", with: "email@email.com"
					fill_in "user_password", with: "foobar"
					fill_in "user_password_confirmation", with: "foobar"
				end

				it "should add a new user after clicking 'Registar!' " do
					expect do
						click_button "Signup!"
					end.to change(User, :count).by(1)
				end

				it "should send a flash message with success" do
					click_button "Signup!"
					should have_selector('div.alert.alert-success',
										 :text => "Welcome, username!")
				end

				it "should be signed in after signing up" do
					should have_link("username ")
				end
			end
		end
	end

	describe "that need authentication" do
		
		before do
		  @user = User.create!(name: "Example User", email: "user@example.com",
									 username: "exampleuser", password: "foobar", 
									 password_confirmation: "foobar")
		  visit signin_path
		  fill_in "session_email",    with: @user.email
		  fill_in "session_password", with: @user.password
		  click_button "Sign in"
		end

		describe "show page" do

			before do
			  visit profile_path
			end

			it "should have title with the user name(or username?)" do
				should have_selector('title', text: @user.username)
			end

			it "should have h1 with 'perfil'" do
				should have_selector('h1', text: "Perfil de #{@user.username}")
			end

			it "should have gravatar" do
				should have_selector('img', :class => "gravatar")
			end

			it "should have a map" do
				should have_selector('div.map')
			end
		end

		describe 'edit user path' do
			
			before do
				visit settings_path
			end

			it "should have title 'Settings'" do
				should have_selector('title',
											text: "Setings")
			end

			it "should have h1 with 'Settings" do
				should have_selector('h1',
											text: "Settings")
			end
		end
	end
end
