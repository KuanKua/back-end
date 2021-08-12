class Phrase < ApplicationRecord
  # has_one_attached :phrase_image
  # has_one_attached :phrase_audio

  belongs_to :directory
  belongs_to :user
  
end
