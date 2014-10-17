class Warmup < Thor
  desc 'start FILE', 'Warmup Redis and build indexes from FILE'
  def start(file)
    File.open(file, 'rb') do |file|
      json = JSON.parse(file.read)
      safe = prepare_data(json.sort)
      store(safe)
      index(safe)
    end
  end

  private

  def redis
    @redis ||= AutocompleteMe.config.redis
  end

  def prepare_data(contents)
    contents.each_with_index.map do |(key, values), index|
      safe = key.downcase.gsub(/[^\w]/, '')
      [index, safe, JSON.generate(values)]
    end
  end

  def store(contents)
    contents.each { |(i, k, v)| redis.set("content:#{i}", v) }
  end

  def index(contents)
    data = contents.map { |i, k, _| [i, k, k.length] }
    create_indexes(data)
  end

  def create_indexes(data, len = 1)
    groups = data.group_by { |(_, key)| key[0..len] }
    groups.each do |(term, group)|
      ids       = group.map(&:first)
      selection = group.select { |(_, _, length)| length > term.length }
      redis.sadd("index:#{term}", ids)
      create_indexes(selection, len + 1) if selection.size > 0
    end
  end
end
