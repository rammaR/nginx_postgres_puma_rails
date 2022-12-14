class Subject < ApplicationRecord
    validates :description, presence: true

    def print_title
        return "Questions about #{description}"
    end
end
