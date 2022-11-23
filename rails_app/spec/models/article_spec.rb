require 'rails_helper'

RSpec.describe Article, type: :model do
  it 'Create a article' do
    article = create(:article)

    expect(article.status).to eq("unpublished")

    article.status = :published
    expect(article.status).to eq("published")
  end
end
