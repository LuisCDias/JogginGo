require 'spec_helper'

describe User do

	before do
		@user = User.new(name: "Example User", email: "user@example.com",
			username: "exampleuser", password: "foobar", password_confirmation: "foobar")
	end

	subject { @user }

	it { should respond_to(:name) }
	it { should respond_to(:email) }
	it { should respond_to(:username)}
	it { should respond_to(:password_digest) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
	it { should respond_to(:remember_token) }
	it { should respond_to(:admin) }

	describe 'mandatory fields should not be empty' do
		
		it "should validate name presence" do
			@user.name = ""
			should_not be_valid
		end

		it "should validate email presence" do
			@user.email = ""
			should_not be_valid
		end

		it "should validate username presence" do
			@user.username = ""
			should_not be_valid
		end

		it "should validate password presence" do
			@user.password = ""
			should_not be_valid
		end
	end

	describe 'name should not have more than 40 chars' do
		
		before do
			@user.name = "a" * 41
		end

		it "should not be valid" do
			@user.should_not be_valid 
		end
	end

	describe "usernames should not have more than 20 chars" do
		
		before do
			@user.username = "a" * 21
		end

		it "should not be valid" do
			@user.should_not be_valid 
		end
	end

	describe 'validate username uniqueness' do
		
		before do
			user_with_same_username = @user.dup
			user_with_same_username.email = "something@different.com"
			user_with_same_username.save
		end

		it 'should not be valid' do		
			@user.should_not be_valid
		end

		describe 'validate username uniqueness even with upcase' do

			before do
				user_with_same_username = @user.dup
				user_with_same_username.email = "something@different.com"
				user_with_same_username.username = @user.username.upcase
				user_with_same_username.save
			end

			it 'should not be valid' do		
				@user.should_not be_valid
			end
		end

	end

	describe 'validate email uniqueness' do
		
		before do
			user_with_same_email = @user.dup
			user_with_same_email.username = "somethingdifferent"
			user_with_same_email.save
		end

		it 'should not be valid' do		
			@user.should_not be_valid
		end

		describe 'validate email uniqueness even with upcase' do

			before do
				user_with_same_email = @user.dup
				user_with_same_email.username = "somethingdifferent"
				user_with_same_email.email = @user.email.upcase
				user_with_same_email.save
			end

			it 'should not be valid' do		
				@user.should_not be_valid
			end
		end

	end

	describe 'accept only valid emails' do

		it "should be valid" do
			example_emails = %w[user1@example.com user2@example.com user3@example.com]
			example_emails.each do |valid_email|
				@user.email = valid_email
				@user.should be_valid				
			end
		end
	end

	describe 'dont accept invalid emails' do

		it "should not be valid" do
			example_emails = %w[user1@example user2example.com user@example..com]
			example_emails.each do |invalid_email|
				@user.email = invalid_email
				@user.should_not be_valid
			end
		end
	end
end
