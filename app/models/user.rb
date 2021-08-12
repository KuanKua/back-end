class User < ApplicationRecord
    has_many :contributions
    
    has_many :user_votes
    has_many :words, through: :user_votes
    
    has_many :directories

    has_many :activities

    has_many :followers, foreign_key: :follower_id , class_name: "Friendship"
    has_many :followed, through: :followers
    has_many :followed, foreign_key: :followed_id, class_name: "Friendship"
    has_many :followers, through: :followed

    has_many :words
    has_many :phrases
    has_many :characters
    has_many :sentences
    has_many :longtexts

    has_secure_password

    def without_self
        temp = User.all.select{
            |user| user != self
        }
        return temp
    end

    def following
        self.without_self.select{ |user|
            user.followers.include? self
        }
    end

    def follow_each_other
        self.without_self.select{|user| (user.followers.include? self) && (self.followers.include? user)}
    end

    def user_not_following_back
        self.without_self.select{|user| (!user.followers.include? self) && (self.followers.include? user) }
    end

    def no_friendship
        self.without_self.select{|user| (!user.followers.include? self) && (!self.followers.include? user)}
    end

    def not_following
        self.without_self.select{|user| (!user.followers.include? self)}
    end
    
end
