require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class PostControllerTest < Test::Unit::TestCase
  context "PostController" do
    setup do
		@post = Post.new
		@post.body = "this is a post"
		@post.save

		@author = Author.new
		@author.name = "Dave"
		@author.save

		@post.author = @author
		@post.save

		@posts = []
		@posts << @post
		end


    should "return all posts when index called" do
      assert_equal "Hello World", last_response.body
    end
  end
end
