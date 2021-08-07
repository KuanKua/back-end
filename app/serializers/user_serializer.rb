class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :bio, :date_of_birth, :nationality, :education_status, :address, :email, :phone_number, :organization, :website, :instagram, :facebook, :github
end
