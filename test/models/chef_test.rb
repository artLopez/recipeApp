require 'test_helper'

class ChefTest < ActiveSupport::TestCase
	
	def setup
		@chef = Chef.new(chefname: "Arturo", email: "art@example.com")
	end

	test 'chef should be valid' do 
		assert @chef.valid?
	end

	test 'chef should be present' do
		@chef.chefname = " "
		assert_not @chef.valid?
	end

	test 'chef name not be too long' do 
		@chef.chefname = "art" * 30
		assert_not @chef.valid?
	end

	test 'chef name must not be too short' do
		@chef.chefname = "f"
		assert_not @chef.valid?
	end

	test 'email should be present' do
		@chef.email = " "
		assert_not @chef.valid?
	end

	test 'email should be within bounds' do
		@chef.email = 'artuds@example.com' * 30
		assert_not @chef.valid?
	end

	test 'email should be unique' do
		chef_2 = @chef.dup
		chef_2.email = @chef.email.upcase
		@chef.save
		assert_not chef_2.valid?
	end

	test 'email validation should accept valid emails' do
		valid_emails = %w[user@eee.com R_TDD-DS@eee.hello.com user@example.com first.last@eee.au ]

		valid_emails.each do |email|
			@chef.email = email
			assert @chef.valid?, '#{email.inspect} should be valid'
		end
	end

	test 'email validation should reject invalid emails' do
		invalid_emails = %w[ues@@team teamUSA@hell,com google@google;com ]

		invalid_emails.each do |email|
			@chef.email = email
			assert_not @chef.valid?, '#{email.inspect} should be invalid'
		end
	end

end
