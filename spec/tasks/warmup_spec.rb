require 'spec_helper'
load File.expand_path('lib/tasks/warmup.thor')

describe Warmup do
  let(:file_path) { File.expand_path('spec/fixtures/places.json') }
  let(:redis)     { Geocomplete.config.redis }

  before { Warmup.new.start(file_path) }

  context 'content creation' do
    subject { JSON.parse(redis.get('content:0')) }

    it { is_expected.to include 'country' => 'United States', 'state' => 'Utah', 'county' => 'Millard' }
  end

  context 'index creation' do
    context 'when partial phrase' do
      subject    { redis.smembers('index:oak') }
      its(:size) { is_expected.to eql 2 }
      it         { is_expected.to include *%w(0 1) }
    end

    context 'when complete phrase' do
      subject    { redis.smembers('index:oaklandca') }
      its(:size) { is_expected.to eql 1 }
      it         { is_expected.to include *%w(1) }
    end
  end

end
