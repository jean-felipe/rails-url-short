require 'rails_helper'

RSpec.describe ShortUrlServices do
  describe '#generate_title' do
    context 'when valid url required' do
      it 'gets the website title' do
        title = described_class.generate_title('http://google.com')
        expect(title).to eq('Google')
      end
    end
  end

  describe '#generate_short_url' do
    context 'when valid url required' do
      it 'generates the short url' do
        short_url = described_class.generate_short_url(25)
        expect(short_url).to eq('z')
      end
    end
  end
end
