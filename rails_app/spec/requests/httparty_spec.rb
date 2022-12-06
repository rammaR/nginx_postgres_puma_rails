require 'rails_helper'

describe "HTTParty", type: :request do
    it 'requesting jsonplaceholder should return a json' do
        stub_request(:get, 'https://jsonplaceholder.typicode.com/todos/1').
            to_return(status: 200, body: "", headers: {'content-type': 'application/json'})
        response = HTTParty.get('https://jsonplaceholder.typicode.com/todos/1')
        content_type = response.headers['content-type']
        expect(content_type).to match(/application\/json/)
    end
end
