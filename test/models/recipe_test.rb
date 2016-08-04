require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

	def setup
		@chef = Chef.create(chefname: 'Arturo', email: 'arturo@hellskitchen.com')
		@recipe = @chef.recipes.build(name: "chicken soup", 
							 summary: "Best chicken soup recipe ever!",
		 					 description: "Add chicken into the soup, boil for 30 min.")
	end

	test "recipe should be valid" do
		assert @recipe.valid?
	end

	test 'chef id should be present' do
		@recipe.chef_id = nil
		assert_not @recipe.valid?
	end

	test "name should be present" do
		@recipe.name = " "
		assert_not @recipe.valid?
	end

	test "name length should not be too long" do
		@recipe.name = "a" * 101
		assert_not @recipe.valid?
	end

	test "name length should not be too short" do
		@recipe.name = "taco"
		assert_not @recipe.valid?
	end

	test "summary should be present" do
		@recipe.summary = " "
		assert_not @recipe.valid?
	end

	test "summary length should not be too long" do
		@recipe.summary = "taco" * 50
		assert_not @recipe.valid?
	end

	test "summary length should not be too short" do
		@recipe.summary = "yums"
		assert_not @recipe.valid?

	end

	test "description must be present" do
		@recipe.description = " "
		assert_not @recipe.valid?
	end

	test "description should not be too long" do
		@recipe.description = "5 cups" * 500
		assert_not @recipe.valid?
	end

	test "description should not be too short" do
		@recipe.description = "tacos are yums"
		assert_not @recipe.valid?
	end

end
