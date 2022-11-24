class PostController < ApplicationController

    before_filter :authorize, only: [:edit]

    def index
        render plain: 'Everyone can see me!'
    end

    def edit
        render plain: "I'm only accessible if you know the password"
    end
end
