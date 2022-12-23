require 'rails_helper'

RSpec.describe ShortUrlsController do
  describe '#create' do
    context 'when creating a new short url' do
      let(:params) do
        {
          short_url: {
            original_url: 'https://google.com'
          }
        }
      end

      it 'changes the count by one' do
        expect { post :create, params: params }.to change { ShortUrl.count }.by(1)
      end

      it 'creates a new short url' do
        response = post :create, params: params

        json = JSON.parse(response.body)

        expect(json['original_url']).to eq('https://google.com')
        expect(json['title']).to eq('Google')
      end
    end
  end
end
