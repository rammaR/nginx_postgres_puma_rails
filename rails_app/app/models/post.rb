class Post < ApplicationRecord

    include Votable

    validates :title, :content, presence: true

    has_many :comments

end
