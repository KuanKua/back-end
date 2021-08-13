class WordsController < ApplicationController

    def index
        all_words = Word.all
        render json: all_words, include: [:word_image, :word_audio]
    end

    def create
        new_word = Word.create!(word_params)
        new_cont = Contribution.create(directory_id: word_params[:directory_id], user_id: word_params[:user_id])
        new_cont.save

        #new_word.user.activities << Activity.create(activity_log: "@#{dir.user.username} added a new word entry to the word directory called #{new_word.directory.directory_name}", user_id: new_word.user.id)
        
        dir = Directory.find_by(id: word_params[:directory_id])
        dir.directory_size = dir.directory_size + 1
        dir.save

        words_in_directory = Word.all.select{
            |word|
            word.directory_id == word_params[:directory_id]
        }
        contributors = []

        words_in_directory.each{
            |word|
            contributors << word.user
        } #Make entries belong to a user

        dir.contr_num = contributors.uniq.length
        dir.save

        render json: new_word
    end

    def votes
        word = Word.find_by(id: params[:word_id])

        votes = word.user_votes.count

        render json: {votes: votes}
    end

    def approve
        user_vote = UserVote.create(user_id: params[:user_id], word_id: params[:word_id], value: "Approved")
        user_vote.save
    end

    def disapprove
        user_vote = UserVote.select{
            |uservote| 
            (uservote[:user_id] == params[:user_id] && user_vote[:word_id] == params[:word_id])
        }
        user_vote.destroy
    end

    private

    def word_params
        params.require(:word).permit(:word_input, :definition, :pronunciation, :word_english_translation, :part_of_speech, :sentence_example, :sentence_example_english_translation, :additional_remark, :directory_id, :word_audio, :word_image ,:user_id)
    end

end
