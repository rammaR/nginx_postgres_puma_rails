class Comment < ApplicationRecord

    include Votable

    validates :content, presence: true

    belongs_to :post

end
