require 'spec_helper'

describe User do

	before do
		@user = User.new(name: "Example User", email: "user@example.com",
			username: "exampleuser")
	end

	subject { @user }

	it { should respond_to(:name) }
	it { should respond_to(:email) }
	it { should respond_to(:username)}
	it { should respond_to(:password_digest) }

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
	end
end
