class Character < ApplicationRecord
  # has_one_attached :character_audio
  # has_one_attached :character_image

  belongs_to :directory
  belongs_to :user
end
