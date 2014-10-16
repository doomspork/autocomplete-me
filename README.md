# Geocomplete

A simple and blazing fast micro-service for powering geographical places autocomplete.

Geocomplete exists because I wanted to create a micro-service that would allow me to replace [Google Places Autocomplete](https://developers.google.com/places/documentation/autocomplete) on [CityLeash](http://www.cityleash.com).  I decided to build on Rack and package it up as a gem so it could run independently or within another application (e.g. Rails Engine).
      
[![Build Status](https://travis-ci.org/doomspork/geocomplete.svg?branch=master)](https://travis-ci.org/doomspork/geocomplete) [![Code Climate](https://codeclimate.com/github/doomspork/geocomplete.png)](https://codeclimate.com/github/doomspork/geocomplete) [![Coverage Status](https://coveralls.io/repos/doomspork/geocomplete/badge.png)](https://coveralls.io/r/doomspork/geocomplete) [![Dependency Status](https://gemnasium.com/doomspork/geocomplete.svg)](https://gemnasium.com/doomspork/geocomplete)

## Table of Contents
  1. [Quick start](#quickstart)
  1. [Deploying](#deploying)
     1. [Standalone](#standalone)
     1. [Mounted](#mounted)
  1. [Data](#data)
  1. [Warm-up](#warm-up)
  1. [Testing](#testing)
  1. [Contributing](#contributing)
  1. [Author/Contact](#author/contact)
  1. [License](#license)
      
## Quick start

The fastest way to be up and running, locally, with a fully functional application only takes a couple steps and a few minutes:

1. `bundle install`
2. `bundle exec thor usgs:download`
3. `bundle exec thor usgs:parse`
4. `bundle exec thor warmup:start places.json`
5. `bundle exec foreman start`

## Deploying

### Standalone

It's easy to run Geocomplete on your favorite app server because it's a simple Rack app.  For local development you can issue the `rackup` command or alternatively you can use Unicorn and Foreman, both of which are included as development dependencies.

To have Foreman manage both the Unicorn and Redis process we can kick it off with:

+ `bundle exec foreman start`

### Mounted

Geocomplete is also packaged as a gem so you can easily include it in another project.  To start we need to include Geocomplete in your `Gemfile`:
 
+ `gem 'geocomplete', github: 'doomspork/geocomplete'`

Next we'll modify `config/routes.rb` to mount the application within Rails:

+ `mount Geocomplete::Service => '/geo'`

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

## Contributing

Features, feedback, and fixes are always welcome!  Please make use of [Issues](https://github.com/doomspork/geocomplete/issues) and [Pull Requests](https://github.com/doomspork/geocomplete/pulls), all code should have test coverage.

## Author/Contact

Geocomplete is written and maintained by [@doomspork](github.com/doomspork).

## License

Geocomplete is made available under the [MIT](http://opensource.org/licenses/MIT) License.
