class Vote < ActiveRecord::Base
	belongs_to :category
	belongs_to :song
	belongs_to :user
end
