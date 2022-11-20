class FilterObscenity < ActiveJob::Base

    def perform(post_id)
        post = Post.find(post_id)
        post.title = sanitize(post.title)
        post.body = sanitize(post.body)
        post.save!
    end

    BLACKLIST = {
        'poop' => 'dookie',
        'python' => 'ruby'
    }

    private
        def sanitize(str)
            BLACKLIST.each do |bad, good| do
                str.gsub!(bad, good)
            end

            str
        end
end