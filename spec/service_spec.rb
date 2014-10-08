require 'spec_helper'

module Geocomplete
  describe Service do
    let(:redis) { Geocomplete.config.redis }

    describe 'GET /' do
      before do
        redis.set('abc', JSON.generate(%w(1 2 3)))
      end

      context 'when missing a term' do
        it 'will return 400 Bad Request' do
          get '/'
          expect(last_response.status).to eq 400
        end
      end

      it 'will return a collection' do
        get '/', t: 'abc'
        expect(last_response.status).to eq 200
        expect(response).to include *%w(1 2 3)
      end
    end
  end
end
