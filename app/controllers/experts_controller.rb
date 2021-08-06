class ExpertsController < ApplicationController
    def index
        experts = Expert.all
        render json: experts
    end

    def show
        expert = Expert.find_by(id: params[:id])
        if expert
            render json: expert
        else
            render json: {error: "Expert not found!"}
        end
    end
end
