require 'rails_helper'

describe "HTTParty", vcr: {match_requests_on: [:body], :record => :new_episodes} do
    it 'requesting jsonplaceholder should return a json' do
        response = HTTParty.get("https://jsonplaceholder.typicode.com/todos/#{[1,2,3,4,5,6,7,8,9,10].sample}")
        content_type = response.headers['content-type']
        expect(content_type).to match(/application\/json/)
    end
end
