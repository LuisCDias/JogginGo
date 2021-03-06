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
					click_button "Signup!"
					should have_selector('title', text: "username")
				end
			end
		end

		describe "all users (index) path" do
			
			before do
			  visit users_path
			end

			it "should have title 'Members' " do
				should have_selector('title', text: "Members")
			end

			it "should have h1" do
				should have_selector('h1', text: "Members")
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
				should have_selector('h1', text: "#{@user.username}'s profile")
			end

			it "should have gravatar" do
				should have_selector('img', :class => "gravatar")
			end

			it "should have a map" do
				should have_selector('div.map_container')
			end
		end

		describe 'edit user path' do
			
			before do
				visit settings_path
			end

			it "should have title 'Settings'" do
				should have_selector('title',
											text: "Settings")
			end

			it "should have h1 with 'Settings" do
				should have_selector('h1',
											text: "Settings")
			end
		end

		describe 'destroy user path' do
			
			before do
			  @admin = User.create!(username: "admin", name: "Administrator", email: "admin@example.com",
							 		password: "foobar", password_confirmation: "foobar")
			  @admin.toggle!(:admin)
			end

			describe 'visiting users index while NOT signed in as admin' do
				
				before do
				  visit users_path
				end

				it "should not have link to delete" do
					should_not have_link "Remover"
				end
			end

			describe 'visiting users index while SIGNED in as admin' do
				
				before do
					click_link "Signout"
					visit signin_path
					fill_in "session_email",    with: @admin.email
					fill_in "session_password", with: @admin.password
					click_button "Sign in"
					visit users_path
				end

				it "should have link to delete user" do
					should have_link "Remove"
				end

				it "should not have link to delete Admin" do
					should_not have_link "Remove", href: user_path(@admin)
				end

				describe 'delete a user' do

					it "should delete the user after clicking 'Remove' " do
						expect do
							click_link("Remove")
						end.to change(User, :count).by(-1)
					end

					it "should show a message" do
						have_selector('div.alert.alert-success')
					end

					it "should redirect to users index" do
						have_selector('title',
											text: "Membros")
					end
				end
			end
		end
	end
end
