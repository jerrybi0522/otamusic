class Song < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	has_many :comments
	has_many :favorites
	has_many :votes
	has_many :categories, through: :votes

	attr_accessor :favorite

	# def count(song, category)
 #    count = 0
 #    song.votes.each do |v|
 #      if v.category == category
 #        count+=1
 #      end
 #    end
 #    count
 #  end

 	def count(category)
    count = 0
    self.votes.each do |v|
      if v.category == category
        count+=1
      end
    end
    count
  end

end
