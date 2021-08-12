class Word < ApplicationRecord
  # has_one_attached :word_image
  # has_one_attached :word_audio

  has_many :user_votes
  has_many :users, through: :user_votes

  belongs_to :user

  belongs_to :directory  
end
