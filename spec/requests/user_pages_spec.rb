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
					:text => "Enter your information")
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
						click_button "Sign up!"
					end.not_to change(User, :count)
				end

				it "should send a flash message with error" do
					click_button "Sign up!"
					should have_selector('div.alert.alert-error',
										 :text => "Your signup has errors")
				end
			end
		end
	end
end
