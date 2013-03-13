require 'support/active_record'

class MyTestClass < ActiveRecord::Base
  include Dynattribs

  dynamic_attr_accessor :dynamic_attribs, :info, :is_bool, :age, :tested_at

end