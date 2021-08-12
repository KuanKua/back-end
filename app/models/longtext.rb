class Longtext < ApplicationRecord
  # has_one_attached :long_text_audio
  # has_one_attached :long_text_image

  belongs_to :directory
  belongs_to :user
end
