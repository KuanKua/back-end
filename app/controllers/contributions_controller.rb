class ContributionsController < ApplicationController

    def index
        contributions = Contribution.all
        render json: contributions
    end

    def show
        contribution = Contribution.find_by(id: params[:id])
        if contribution
            render json: contribution
        else
            render json: {error: "Contribution not found!"}
        end
    end
end
