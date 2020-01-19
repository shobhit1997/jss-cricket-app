class User < ApplicationRecord
	has_many :batting_performance
	has_many :bowling_performance
end
