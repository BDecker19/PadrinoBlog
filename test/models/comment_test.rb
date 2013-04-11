require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

class CommentTest < Test::Unit::TestCase
  context "Comment Model" do

    setup do 
      @author = Author.new(:name => "fred")
      @author.save

      @post = Post.new(:title => "awesome post")
      @post.save

      @comment = Comment.new(:body => "sweet post fred")
      @comment.save

      @author.comments << @comment
      @post.comments << @comment
    
    end

    should "be retreivable via author and post" do
      assert_equal @author.comments[0].post.title, "awesome post"
    end

  end
end
