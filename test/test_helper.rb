# frozen_string_literal: true

# Configure Rails Environment
ENV['RAILS_ENV'] = 'test'


# Load dummy rails application with combustion gem
require 'combustion'
Combustion.path = 'test/dummy'
Combustion.initialize! :active_record
include ActionDispatch::TestProcess

# Load other test helpers
require 'rails/test_help'
require 'carrierwave'
require 'carrierwave/orm/activerecord'

# Filter out Minitest backtrace while allowing backtrace from other libraries
# to be shown.
Minitest.backtrace_filter = Minitest::BacktraceFilter.new

require 'rails/test_unit/reporter'
Rails::TestUnitReporter.executable = 'bin/test'

# Load fixtures from the engine
if ActiveSupport::TestCase.respond_to?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path('fixtures', __dir__)
  ActionDispatch::IntegrationTest.fixture_path = ActiveSupport::TestCase.fixture_path
  ActiveSupport::TestCase.file_fixture_path = ActiveSupport::TestCase.fixture_path + '/files'
  ActiveSupport::TestCase.fixtures :all
end

puts "Running tests with Rails v.#{Rails.version}"
