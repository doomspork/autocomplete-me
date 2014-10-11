require 'spec_helper'
load File.expand_path('lib/tasks/usgs.thor')

describe Usgs do
  let(:file_path) { File.expand_path('spec/fixtures/places.json') }
  let(:task)      { Usgs.new }

  context '#download' do
    let(:entry)   { Struct.new(:name).new('Entry') }
    let(:archive) { Struct.new('Archive') }
    let(:remote_data) { 'data' }

    before do
      mock(Net::HTTP).get(anything) { remote_data }
    end

    subject { task.download }

    context 'with remote file' do
      before do
        mock(File).exists?(anything) { false }
        mock(Dir).mkdir(anything)
        mock(Zip::InputStream).open(anything).yields(archive)
        mock(archive).get_next_entry { entry }
        mock(archive).get_next_entry { nil }
        mock(entry).extract(anything)
      end

      it { is_expected.to be_nil }
    end

    context 'when download fails' do
      let(:remote_data) { nil }

      before do
        mock(task).print(/^Downloading/)
        mock(task).print('Failed to download remote file')
      end

      it { is_expected.to be_nil }
    end
  end

  context '#parse' do
    let(:mock_file) { Struct.new('MockFile').new }

    before do
      stub(task).options { { directory: File.expand_path('spec/fixtures/state_codes') } }
      stub.proxy(File).open { |f| f }
      stub(File).open(is_a(String), 'wt').yields(mock_file)
      mock(mock_file).write(is_a(String)) do |output|
        json = JSON.parse(output)
        expect(json.keys.size).to eq 4
        expect(json).to_not include(name: 'FEATURE_ID')
        expect(json).to_not include(name: 'Colorado River Indian Reservation')
      end
    end

    subject { task.parse }

    it { is_expected.to be_nil }
  end
end
