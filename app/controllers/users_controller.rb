class UsersController < ApplicationController

    def index
        users = User.all
        render json: users
    end

    before_action :authenticate

    def show
      #@current_user.update(first_name: params[:first_name], last_name: params[:last_name], date_of_birth: params[:date_of_birth], nationality: params[:nationality], education_status: params[:education_status], country_of_residence: params[:country_of_residence], bio: params[:bio])
      render json: @current_user
    end

end
