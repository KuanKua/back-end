class CharactersController < ApplicationController
    def index
        all_characters = Phrase.all
        render json: all_characters
    end

    def create
        new_character = Character.create!(character_params)

        new_cont = Contribution.create(directory_id: character_params[:directory_id], user_id: character_params[:user_id])
        new_cont.save

        #new_character.user.activities << Activity.create(activity_log: "@#{dir.user.username} added a new character entry to the character directory called #{new_character.directory.directory_name}", user_id: new_character.user.id)

        dir = Directory.find_by(id: character_params[:directory_id])
        dir.directory_size = dir.directory_size + 1
        dir.save

        characters_in_directory = Character.all.select{
            |character|
            character.directory_id == character_params[:directory_id]
        }
        contributors = []
        characters_in_directory.each{
            |character|
            contributors << character.user
        }

        dir.contr_num = contributors.uniq.length
        dir.save

        render json: new_character
    end

    private

    def character_params
        params.require(:character).permit(:character_input, :pronunciation, :word_example, :word_definition, :word_pronunciation, :word_part_of_speech, :additional_remark, :directory_id, :character_image, :character_audio, :user_id)
    end
end
