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

    def following #USED
      user = User.find_by(id: params[:id])
      render json: user.following
    end

    def notFollowing #USED
      user = User.find_by(id: params[:id])
      puts user.id
      puts user
      render json: user.not_following
    end

    def follow
      user1 = User.find_by(id: params["id1"])
      user2 = User.find_by(id: params["id2"])
      user2.followers << user1
      activity = Activity.create(activity_log: "@#{user1.username} started following @#{user2.username}.")
      user1.activities << activity
      user2.activities << activity
      user2.save
    end

    def unfollow
      user1 = User.find_by(id: params["id1"])
      user2 = User.find_by(id: params["id2"])
      user2.followers.delete(user1)
      activity = Activity.create(activity_log: "@#{user1.username} stopped following @#{user2.username}.")
      user1.activities << activity
      user2.activities << activity
      user2.save
    end

    def activities
      user = User.find_by(id: params[:id])
      my_activities = user.activities
      user.followers.each{
         |follower| 
         my_activities = my_activities + follower.activities
      }
      render json: my_activities.uniq
    end

    def update
      user = User.find_by(id: params[:id])
      user.update(user_params)
      user.save
      render json: user
    end

    def destroy
      user=User.find_by(id: params[:id])
      user.destroy
    end

    def directories
      user=User.find_by(id: params[:id])
      render json: user.directories
    end

    def regenerate
      generator = ColorGenerator.new saturation: 0.3, value: 1.0
      randomColor1 = generator.create_hex
      randomColor2 = generator.create_hex
      randomColor3 = generator.create_hex
      randomColor4 = generator.create_hex
      randomColor5 = generator.create_hex
      user = User.find_by(id: params[:id])
      user.update(avatar_address: "https://source.boringavatars.com/marble/120/#{user[:username]}?colors=#{randomColor1},#{randomColor2},#{randomColor3},#{randomColor4},#{randomColor5}")
      user.save
    end
   
    private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :bio, :date_of_birth, :nationality, :education_status, :address, :email, :phone_number, :organization, :website, :github, :instagram, :twitter, :facebook, :avatar_address)
    end
end
