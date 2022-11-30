FactoryBot.define do

    factory :post do
        title Faker::TvShows::Seinfeld.character
        content Faker::TvShows::Seinfeld.quote
    end

end