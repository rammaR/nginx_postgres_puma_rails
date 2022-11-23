class Article < ApplicationRecord
    enum status: [:unpublished, :published]
end
