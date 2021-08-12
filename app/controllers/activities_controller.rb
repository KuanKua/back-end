class ActivitiesController < ApplicationController
    def index
        all_activities = Activity.all
        render json: all_activities
    end

    def daysPassed
        activity = Activity.find_by(id: params[:id])
        render json: {daysPassed: (Time.current.to_date - activity.created_at.to_date).to_i}
    end
end
