class User < ApplicationRecord
    has_many :contributions
    has_many :user_votes
    has_many :contributions, through: :user_votes
end
