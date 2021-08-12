class SentencesController < ApplicationController
    
    def index
        all_sentences = Sentence.all
        render json: all_sentences
    end

    def create
        new_sentence = Sentence.create!(sentence_params)

        new_cont = Contribution.create(directory_id: sentence_params[:directory_id], user_id: sentence_params[:user_id])
        new_cont.save

        #new_sentence.user.activities << Activity.create(activity_log: "@#{dir.user.username} added a new sentence entry to the sentence directory called #{new_sentence.directory.directory_name}", user_id: new_sentence.user.id)

        dir = Directory.find_by(id: sentence_params[:directory_id])
        dir.directory_size = dir.directory_size + 1
        dir.save

        sentences_in_directory = Sentence.all.select{
            |sentence|
            sentence.directory_id == sentence_params[:directory_id]
        }
        contributors = []
        sentences_in_directory.each{
            |sentence|
            contributors << sentence.user
        }

        dir.contr_num = contributors.uniq.length
        dir.save

        render json: new_sentence
    end

    private

    def sentence_params
        params.require(:sentence).permit(:sentence_input, :sentence_english_translation, :additional_remark, :directory_id, :sentence_image, :sentence_audio, :user_id)
    end
    
end
