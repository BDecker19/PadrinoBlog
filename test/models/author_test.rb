require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

class AuthorTest < Test::Unit::TestCase
  context "Author Model" do
    
  	setup do 
		@author = Author.new(:name => "fred")
		@author.posts << Post.new(:title => "awesome post")
		@author.comments << Comment.new(:body => "sweet post fred")
	end

 	should "have posts and titles" do
    	assert_equal @author.posts[0].title, "awesome post"
    	assert_equal @author.comments[0].body, "sweet post fred"
    end


  end
end
