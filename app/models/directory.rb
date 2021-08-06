class Directory < ApplicationRecord
    has_many :contributions
    belongs_to :user

    def number_of_contributions
        return self.contributions.count
    end

end
