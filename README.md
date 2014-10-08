# Geocomplete

A simple and blazing fast micro-service for powering geographical places autocomplete.

[![Build Status](https://travis-ci.org/doomspork/geocomplete.svg?branch=master)](https://travis-ci.org/doomspork/geocomplete) [![Code Climate](https://codeclimate.com/github/doomspork/geocomplete.png)](https://codeclimate.com/github/doomspork/geocomplete) [![Coverage Status](https://coveralls.io/repos/doomspork/geocomplete/badge.png)](https://coveralls.io/r/doomspork/geocomplete) [![Dependency Status](https://gemnasium.com/doomspork/geocomplete.svg)](https://gemnasium.com/doomspork/geocomplete)

## Warm-up

Coming soon to a repo near you.

## Data

The `places.json` file within the repo is compiled with the assistance of the United States Board on Geographic Names' State Federal Codes, which can be found [here](http://geonames.usgs.gov/domestic/download_data.htm); this file is included as a courtesy but any source will suffice.  If you do plan to use other sources and still leverage the included warm-up task, your file should be named `places.json` and the JSON appropriately formatted.

## Testing

I am using RSpec so running the tests is straight forward:

+ `bundle exec rspec`

## Why?

I want to replace [Google Places Autocomplete](https://developers.google.com/places/documentation/autocomplete) on [CityLeash](http://www.cityleash.com) so we can leverage OpenStreetMaps instead.

## Contributing

Features, feedback, and fixes welcome!  Please make use of [Issues](https://github.com/doomspork/geocomplete/issues) and [Pull Requests](https://github.com/doomspork/geocomplete/pulls), all code should have test coverage.

## Author/Contact

Geocomplete is written and maintained by [@doomspork](github.com/doomspork).

## License

Geocomplete is made available under the [MIT](http://opensource.org/licenses/MIT) License.
