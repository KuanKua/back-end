class PhrasesController < ApplicationController
    def index
        all_phrases = Phrase.all
        render json: all_phrases
    end

    def create
        new_phrase = Phrase.create!(phrase_params)

        new_cont = Contribution.create(directory_id: phrase_params[:directory_id], user_id: phrase_params[:user_id])
        new_cont.save

        #new_phrase.user.activities << Activity.create(activity_log: "@#{dir.user.username} added a new phrase entry to the phrase directory called #{new_phrase.directory.directory_name}", user_id: new_phrase.user.id)

        dir = Directory.find_by(id: phrase_params[:directory_id])
        dir.directory_size = dir.directory_size + 1
        dir.save

        phrases_in_directory = Phrase.all.select{
            |phrase|
            phrase.directory_id == phrase_params[:directory_id]
        }
        contributors = []
        phrases_in_directory.each{
            |phrase|
            contributors << phrase.user
        }

        dir.contr_num = contributors.uniq.length
        dir.save

        render json: new_phrase
    end

    private

    def phrase_params
        params.require(:phrase).permit(:phrase_input, :meaning, :pronunciation, :phrase_english_translation, :part_of_speech, :sentence_example, :sentence_example_english_translation, :additional_remark, :directory_id, :phrase_image, :phrase_audio, :user_id)
    end
end

