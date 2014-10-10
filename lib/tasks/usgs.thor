require 'csv'
require 'net/http'
require 'uri'
require 'zip'

class Usgs < Thor
  CURRENT_DOWNLOAD = 'AllStatesFedCodes_20141005'

  desc 'download', 'Download the latest known Federal Codes zip'
  method_option :file, aliases: '-f', desc: 'Override the remote filename'
  method_option :verbose, aliases: '-v'
  def download
    print("Downloading remote file at #{filename}")
    uri      = URI("http://geonames.usgs.gov/docs/federalcodes/#{filename}.zip")
    data     = Net::HTTP.get(uri)
    if data
      unless File.exists?(filename)
        print('Creating missing directory')
        Dir.mkdir(filename)
      end
      Zip::InputStream.open(StringIO.new(data)) do |archive|
        while (entry = archive.get_next_entry)
          print("Unpacking #{entry.name}")
          dest = File.join(filename, entry.name)
          entry.extract(dest)
        end
      end
    else
      print('Failed to download remote file')
    end
  end

  desc 'parse', 'Parse Federal Codes into places.json file'
  method_option :file, aliases: '-f', desc: 'Override output file location'
  method_option :directory, aliases: '-d', desc: 'Override input directory'
  method_option :verbose, aliases: '-v'
  def parse
    pattern = File.join(directory, '*.txt')
    print("Finding matching files #{pattern}")
    places  = {}
    Dir.glob(pattern) { |path| parse_places(path, places) }
    write(places)
  end

  private

  def directory
    @directory ||= options[:directory] || CURRENT_DOWNLOAD
  end

  def filename 
    @filename ||= options[:file] || CURRENT_DOWNLOAD
  end

  def parse_places(file, places)
    print("Parsing #{file} for places")
    CSV.foreach(file, col_sep: '|') do |row|
      if row[2] == 'Populated Place'
        place = label_values(row)
        key   = "#{place[:name]}, #{place[:state]}"
        print("Found #{key}")
        places[key] = place
      end
    end
  end

  def print(msg)
    puts msg if options[:verbose]
  end

  def label_values(tokens)
    {
      county:     tokens[11],
      latitude:   tokens[12].to_f,
      longitude:  tokens[13].to_f,
      name:       tokens[1],
      state:      tokens[8]
    }
  end

  def write(output) 
    filename = options[:file] || 'places.json'
    File.open(filename, 'wt') do |file| 
      json = JSON.pretty_generate(output)
      file.write(json)
    end
  end
end
