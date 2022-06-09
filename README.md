# Carrierwave Image Validate

[![Gem Version](http://img.shields.io/gem/v/gems.svg)][gem]
[![Build Status](https://github.com/rubygems/gems/workflows/ubuntu/badge.svg)][gh-actions]
[![Code Climate](https://api.codeclimate.com/v1/badges/45ff982a29d7a000ee84/maintainability)][codeclimate]

[gem]: https://rubygems.org/gems/gems
[gh-actions]: https://github.com/rubygems/gems/actions
[codeclimate]: https://codeclimate.com/github/rubygems/gems/maintainability

If you are using carrierwave gem to upload file and you want to add ratio validations for image
In the future, we will add more validations


## What it can do

- Validate ratio image by range

## Usage

```ruby
class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  validates :avatar, image: { ratio_range: 1..1 }
end
```

- avatar is your field def
- ratio_range is a option of validate.

## Internationalization

Carrierwave Image Validate uses I18n for error messages
For this, add these keys in your translation file:

```yml
en:
  errors:
    messages:
      aspect_ratio_is_not: "must have an aspect ratio of %{aspect_ratio}"
      aspect_ratio_unknown: "has an unknown aspect ratio"
```

## Installation

Add this line to your application's Gemfile:

```ruby
// require to handle image
gem 'mini_magick', '>= 4.9.5'
// validate
gem 'carrierwave_image_validate'
```

And then execute

```sh
$ bundle
```

## License
Released under the MIT License. See the [LICENSE](https://github.com/rails/thor/blob/main/LICENSE.md) file for further details.
