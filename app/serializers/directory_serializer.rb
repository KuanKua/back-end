class DirectorySerializer < ActiveModel::Serializer
    attributes :views, :id, :language_name, :language_description, :database_description, :directory_name, :primarily_spoken_at, :directory_type, :user_id, :updated_at, :created_at, :directory_size, :contr_num, :goal
end
  