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
end
