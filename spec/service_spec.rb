require 'spec_helper'

module Geocomplete
  describe Service do
    let(:redis) { Geocomplete.config.redis }

    describe 'GET /' do
      before do
        redis.set('content:1', { country: 'United States', state: 'Utah', county: 'Millard'}.to_json)
        redis.sadd('index:oak', 1)
      end

      context 'when missing a term' do
        it 'will return 400 Bad Request' do
          get '/'
          expect(last_response.status).to eq 400
        end
      end

      it 'will return a collection' do
        get '/', t: 'oakland'
        expect(last_response.status).to eq 200
        expect(response).to include 'country' => 'United States', 'state' => 'Utah', 'county' => 'Millard'
      end
    end
  end
end
