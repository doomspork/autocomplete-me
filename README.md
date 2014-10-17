# AutocompleteMe

A simple and blazing fast micro-service for powering autocompletion.

AutocompleteMe exists because I wanted to create a micro-service that would allow me to replace [Google Places Autocomplete](https://developers.google.com/places/documentation/autocomplete) on [CityLeash](http://www.cityleash.com).  I decided to build it with Rack and package it as a gem so it could be mounted easily within another application (e.g. Rails Engine).

[![Build Status](https://travis-ci.org/doomspork/autocomplete-me?branch=master)](https://travis-ci.org/doomspork/autocomplete-me) [![Code Climate](https://codeclimate.com/github/doomspork/autocomplete-me)](https://codeclimate.com/github/doomspork/autocomplete-me) [![Coverage Status](https://coveralls.io/repos/doomspork/autocomplete-me/badge.png)](https://coveralls.io/r/doomspork/autocomplete-me) [![Dependency Status](https://gemnasium.com/doomspork/autocomplete-me)](https://gemnasium.com/doomspork/autocomplete-me)

## Table of Contents
  1. [Getting Started](#gettingstarted)
  1. [Data](#data)
  1. [Warm-up](#warm-up)
  1. [Testing](#testing)
  1. [Contributing](#contributing)
  1. [Author/Contact](#author/contact)
  1. [License](#license)

## Getting Started

AutocompleteMe is packaged as a gem so you can easily include it in another project.  To start we need to include AutocompleteMe in your `Gemfile`:

+ `gem 'autocomplete-me', github: 'doomspork/autocomplete-me'`

If you're using Rails you'll need to modify `config/routes.rb` to mount the application:

+ `mount AutocompleteMe::Service => '/autocomplete'`

## Data

Any data can be used with AutocompleteMe, and the included warmed-up task, as long as the data can be represented as a JSON object; the keys will be the autocompleted values.  Since this project was initially convienced to replace Places Autocomplete there are two tasks included for the purpose of downloading and parsing populated places from the United States Board on Geographic Names' State Federal Codes, which can be found [here](http://geonames.usgs.gov/domestic/download_data.htm).

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

## Contributing

Features, feedback, and fixes are always welcome!  Please make use of [Issues](https://github.com/doomspork/autocomplete-me/issues) and [Pull Requests](https://github.com/doomspork/autocomplete-me/pulls), all code should have test coverage.

## Author/Contact

AutocompleteMe is written and maintained by [@doomspork](github.com/doomspork).

## License

AutocompleteMe is made available under the [MIT](http://opensource.org/licenses/MIT) License.
