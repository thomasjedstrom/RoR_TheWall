require 'rails_helper'
RSpec.describe User, type: :model do
	it "email should be in a valid format" do
		user = User.new(
			first_name: 'Roald',
			last_name: 'Dahl',
			email: 'roalddahl',
			password: 'abcdefg'
		)
		expect(user).to be_invalid
	end
	it "email should be unique" do
		User.create(
			first_name: "Jane",
			last_name: "Doe",
			email: "janethebest@codingdojo.com"
		)
		user = User.new(
			first_name: "Jane",
			last_name: "Smith",
			email: "janethebest@codingdojo.com"
		)
		expect(user).to be_invalid
	end
	it "all fields must be required (first_name, last_name, email, password)" do
		user = User.new(first_name: '')
		expect(user).to be_invalid
		user = User.new(last_name: '')
		expect(user).to be_invalid
		user = User.new(email: '')
		expect(user).to be_invalid
		user = User.new(password: '')
		expect(user).to be_invalid
	end
	it "password field must be at least 6 characters long." do
		user = User.new(password: 'abcd')
		expect(user).to be_invalid
		user = User.new(
			first_name: "Jane",
			last_name: "Smith",
			email: "janethebest@codingdojo.com",
			password: 'abcdef'
		)
		expect(user).to be_valid
	end
	specify "a user's password should not be readable when they are loaded from the database" do
		my_password = 'foobar22'
		User.create(:first_name => "joe", :last_name => "blow", :email => "joe@blow.com", :password => my_password, :password_confirmation => my_password)
		my_user = User.last
		expect(my_user.password).to_not eq(my_password)
	end	
end
