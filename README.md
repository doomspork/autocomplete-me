# Geocomplete

A simple and blazing fast micro-service for powering geographical places autocomplete.

[![Build Status](https://travis-ci.org/doomspork/geocomplete.svg?branch=master)](https://travis-ci.org/doomspork/geocomplete) [![Code Climate](https://codeclimate.com/github/doomspork/geocomplete.png)](https://codeclimate.com/github/doomspork/geocomplete) [![Coverage Status](https://coveralls.io/repos/doomspork/geocomplete/badge.png)](https://coveralls.io/r/doomspork/geocomplete) [![Dependency Status](https://gemnasium.com/doomspork/geocomplete.svg)](https://gemnasium.com/doomspork/geocomplete)

## TL;DR Steps

1. `bundle install`
2. `bundle exec thor usgs:download`
3. `bundle exec thor usgs:parse`
4. `bundle exec thor warmup:start places.json`
5. `bundle exec foreman start`

## Data

There are two tasks included for the purpose of downloading and parsing populated places from the United States Board on Geographic Names' State Federal Codes, which can be found [here](http://geonames.usgs.gov/domestic/download_data.htm).

To download and extract the latest `AllStatesFedCodes` file:

+ `bundle exec thor usgs:download`

Next we need to parse the individual `StateFedCodes` into a single JSON file which will be used to the warm-up the cache, by default this will create a `places.json` file:

+ `bundle exec thor usgs:parse`

## Warm-up

On occassion it may be necessary to warm-up Redis by populating it with both content and indexes.  There is a task included to make this process easier by parsing a JSON file:

+ `bundle exec thor warm:start JSON_FILE`

## Testing

I am using RSpec so running the tests is straight forward:

+ `bundle exec rspec`

## Why?

I want to replace [Google Places Autocomplete](https://developers.google.com/places/documentation/autocomplete) on [CityLeash](http://www.cityleash.com) so I built this on Rack so it can run independently or within another application (e.g. Rails Engine).

## Contributing

Features, feedback, and fixes are always welcome!  Please make use of [Issues](https://github.com/doomspork/geocomplete/issues) and [Pull Requests](https://github.com/doomspork/geocomplete/pulls), all code should have test coverage.

## Author/Contact

Geocomplete is written and maintained by [@doomspork](github.com/doomspork).

## License

Geocomplete is made available under the [MIT](http://opensource.org/licenses/MIT) License.
