class Category < ActiveRecord::Base
	has_many :songs
	has_many :votes
end
