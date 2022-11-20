module Votable extend ActiveSupport::Concern

    included do
        has_many :votes
    end

    def vote!
        votes.create
    end

    def downvote!
        votes.create(vote_type: :downvote)
    end

    def upvote!
        votes.create(vote_type: :upvote)
    end
    
end