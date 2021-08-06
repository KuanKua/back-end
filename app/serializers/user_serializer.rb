class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :bio, :date_of_birth, :nationality, :education_status, :country_of_residence
end
