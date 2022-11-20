class Vote < ApplicationRecord

    enum vote_type: [:upvote, :downvote]

end
