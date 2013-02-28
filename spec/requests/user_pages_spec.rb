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
										 :text => "Your signup has errors!")
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
			end
		end
	end

	describe "that need authentication" do
		
		describe "show page" do

			before do
			  @user = User.new(name: "Example User", email: "user@example.com",
									 username: "exampleuser", password: "foobar", 
									 password_confirmation: "foobar")

			  @user.save
			  visit user_path(@user)
			end

			it "should have title with the user name(or username?)" do
				should have_selector('title', text: @user.username)
			end

			it "should have h1 with 'perfil'" do
				should have_selector('h1', text: "Perfil de #{@user.username}")
			end
		end
	end
end
