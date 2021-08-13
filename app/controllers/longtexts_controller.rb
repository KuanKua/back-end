class LongtextsController < ApplicationController

    def index
        all_longtexts = Longtext.all
        render json: all_longtexts
    end

    def create
        new_longtext = Longtext.create!(longtext_params)

        new_cont = Contribution.create(directory_id: longtext_params[:directory_id], user_id: longtext_params[:user_id])
        new_cont.save

        #new_longtext.user.activities << Activity.create(activity_log: "@#{dir.user.username} added a new longtext entry to the longtext directory called #{new_longtext.directory.directory_name}", user_id: new_longtext.user.id)

        dir = Directory.find_by(id: longtext_params[:directory_id])
        dir.directory_size = dir.directory_size + 1
        dir.save

        longtexts_in_directory = Longtext.all.select{
            |longtext|
            longtext.directory_id == longtext_params[:directory_id]
        }
        contributors = []
        longtexts_in_directory.each{
            |longtext|
            contributors << longtext.user
        }

        dir.contr_num = contributors.uniq.length
        dir.save

        render json: new_longtext
    end

    def votes
        longtext = Longtext.find_by(id: params[:longtext_id])

        votes = longtext.user_votes.count

        render json: {votes: votes}
    end

    def approve
        user_vote = UserVote.create(user_id: params[:user_id], longtext_id: params[:longtext_id], value: "Approved")
        user_vote.save
    end

    private

    def longtext_params
        params.require(:longtext).permit(:long_text_input, :long_text_english_translation, :additional_remark, :directory_id, :long_text_audio, :long_text_image, :user_id)
    end
end
