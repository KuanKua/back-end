class Sentence < ApplicationRecord
  # has_one_attached :sentence_audio
  # has_one_attached :sentence_image

  belongs_to :directory
  belongs_to :user
end
