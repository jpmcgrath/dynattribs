# Configure Rails Envinronment
ENV["RAILS_ENV"] = "test"

require 'dynattribs'
require File.expand_path("../dummy/my_test_class.rb",  __FILE__)

# Run any available migration
ActiveRecord::Migrator.migrate File.expand_path("../dummy/db/migrate/", __FILE__)
