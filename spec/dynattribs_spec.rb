# -*- coding: utf-8 -*-
require 'spec_helper'

describe Dynattribs do

  it "should store and load dynamic attributes" do
    my_test_class = MyTestClass.new

    my_test_class.info = "This will be stored into info"
    my_test_class.is_bool = false
    my_test_class.age = 24
    my_test_class.tested_at = Time.now

    my_test_class.save.should == true

    loaded_object = MyTestClass.find(my_test_class.id)

    loaded_object.nil?.should == false

    loaded_object.info.should == my_test_class.info
    loaded_object.is_bool.should == my_test_class.is_bool
    loaded_object.age.should == my_test_class.age
    loaded_object.tested_at.should == my_test_class.tested_at
  end
end