require File.expand_path("../lib/dynattribs/version", __FILE__)

# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name                      = "dynattribs"
  s.summary                   = "Dynattribs makes it easy to declare dynamic attributes in ActiveRecord classes."
  s.description               = "The Dynattribs Gem (Dyanmic Attributes) provide a database backed attributes to ActiveRecord::Base classes, without having to declare table columns for each attribute. A bit of NoSQL data flexibility for traditional database backed ActiveRecord classes."
  s.files                     = `git ls-files`.split("\n")
  s.version                   = Dynattribs::VERSION
  s.platform                  = Gem::Platform::RUBY
  s.authors                   = [ "James P. McGrath" ]
  s.email                     = [ "gems@jamespmcgrath.com" ]
  s.homepage                  = "http://jamespmcgrath.com/projects/dynattribs"
  s.rubyforge_project         = "dynattribs"
  s.required_rubygems_version = "> 1.3.6"
  #s.add_dependency "rails", ">= 3.0.7"
  s.add_development_dependency "rspec"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "activerecord"
  s.executables = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
