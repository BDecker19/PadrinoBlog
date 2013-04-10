class Post < ActiveRecord::Base
	has_many :tags, :through => :post_tags
	belongs_to :author
	has_many :comments
end
