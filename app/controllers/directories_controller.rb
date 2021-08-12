class DirectoriesController < ApplicationController
    def index
        directories = Directory.all
        render json: directories
    end

    def show
        directory = Directory.find_by(id: params[:id])
        if directory
            render json: directory
        else
            render json: {error: "Directory not found!"}
        end
    end

    def words
        words = Word.all.select{
            |word|
            word.directory_id == params[:id].to_i
        }
        render json: words
    end

    def phrases
        phrases = Phrase.all.select{
            |phrase|
            phrase.directory_id == params[:id].to_i
        }
        render json: phrases
    end

    def sentences
        sentences = Sentence.all.select{
            |sentence|
            sentence.directory_id == params[:id].to_i
        }
        render json: sentences
    end

    def characters
        characters = Character.all.select{
            |character|
            character.directory_id == params[:id].to_i
        }
        render json: characters
    end

    def longtexts
        longtexts = Longtext.all.select{
            |longtext|
            longtext.directory_id == params[:id].to_i
        }
        render json: longtexts
    end

    def increaseView
        directory = Directory.find_by(id: params[:id])
        directory.views = directory.views + 1
        directory.save
    end

    def create
        dir = Directory.create!(directory_params)
        dir.user.activities << Activity.create(activity_log: "@#{dir.user.username} created a new directory called #{dir.directory_name}", user_id: dir.user.id)
        render json: dir
    end

    def recentfive
        top5 = Directory.all.sort_by { |m| [m.created_at, m.updated_at].max }.reverse!.take(5)
        render json: top5
    end

    def export
        directory = Directory.find_by(id: params[:id])
        if directory.directory_type == "Word"
            render json: directory.words
        elsif directory.directory_type == "Phrase"
            render json: directory.phrases
        elsif directory.directory_type == "Character"
            render json: directory.characters
        elsif directory.directory_type == "Sentence"
            render json: directory.sentences
        elsif directory.directory_type == "Long Text"
            render json: directory.longtexts
        end
    end

    private

    def directory_params
        params.require(:directories).permit(:views, :language_name, :language_description, :database_description, :directory_name ,:primarily_spoken_at, :directory_type, :user_id, :goal)
    end

end
