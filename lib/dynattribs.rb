module Dynattribs

  ############################################################
  #
  # PARSE AND ENCODE THE DYNAMIC FIELD DATA
  # the data is stored to a field defined by "dynamic_attributes_backing_field_name"
  #
  ############################################################

  # parse and return the json encoded values from the encoded
  # data stored in the nominated attribute
  def mapped_data
    return {} if self[dynamic_attributes_backing_field_name].nil?
    JSON.parse(self[dynamic_attributes_backing_field_name])
  end

  # JSON encode and store a hash of attributes
  def mapped_data=hash
    self[dynamic_attributes_backing_field_name] = hash.to_json
  end

  ############################################################
  #
  # GENERAL GET/SET METHODS
  #
  ############################################################

  # a general method for retieving a named attribute
  # from the encoded data
  def get_dynamic_attr(attr_name)
    mapped_data[attr_name]
  end

  # a general method to set the value of the named 
  # attribute in the data map
  def set_dynamic_attr(attr_name, value)
    data_map = self.mapped_data
    data_map[attr_name] = value
    self.mapped_data = data_map
  end

  ############################################################
  #
  # CLASS METHODS
  #
  ############################################################

  # this bit of ma allows us to "include" class methods (instead of
  # the normal "extend")with the mixin.
  # which is needed as the dynamic_attr_accessor method needs
  # to be invoked as a class method as it is used in the class
  # definition, rather than from within a instance method
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods

    # takes two or more arguments, first arg is the name of the database
    # field that backs the dynamic fields data hash.
    # the other arguments are used to create getter/setter methods of 
    # the arguments name.
    def dynamic_attr_accessor(*args)
   
      # the first element in the array is the name of the field
      # used to store the json encoded dynamic attribute data
      dynamic_attributes_backing_field_name = args.shift
      # create a method to access this extra data field name
      self.class_eval("def dynamic_attributes_backing_field_name;'#{dynamic_attributes_backing_field_name}';end") if !dynamic_attributes_backing_field_name.empty?

      # iterate through the rest of the arguments and create
      # a getter and setter method of each of the desired dynamic attributes
      args.each do |arg|
        # getter - creates a wrapper for the get_dynamic_attr method
        self.class_eval("def #{arg};get_dynamic_attr('#{arg}');end")

        # setter - creates a wrapper for the set_dynamic_attr method
        self.class_eval("def #{arg}=(val);set_dynamic_attr('#{arg}', val); end")
      end
    end
  end

end
