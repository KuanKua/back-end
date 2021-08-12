class ContributionSerializer < ActiveModel::Serializer
    attributes :id, :word_input, :audio_address, :character_input, :image_address, :definition, :pronunciation, :verification_status, :sentence_example, :votes, :word_input_english_translation, :sentence_example_english_translation, :directory_id, :user_id
end
  