class Song < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	has_many :comments
	has_many :favorites
	has_many :votes
	has_many :categories, through: :votes

	attr_accessor :favorite
end
