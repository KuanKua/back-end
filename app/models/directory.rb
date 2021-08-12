class Directory < ApplicationRecord
    has_many :contributions
    belongs_to :user

    has_many :words
    has_many :phrases
    has_many :characters
    has_many :sentences
    has_many :longtexts

    # validates :language_name, presence: true

    # validates :language_description, presence: true, length: { minimum: 200 }

    # validates :database_description, presence: true, length: { minimum: 200 }

    # validates :directory_name, presence: true
    # validates :directory_name, uniqueness: {message: "This directory name is already taken!", case_sensitive: false}

    # validates :primarily_spoken_at, presence: true
    # validates :directory_type, presence: true

    def number_of_contributions
        return self.contributions.count
    end


end
