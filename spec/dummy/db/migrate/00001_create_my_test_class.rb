class CreateMyTestClass < ActiveRecord::Migration
  def change
    create_table(:my_test_classes) do |t|
      ## Database authenticatable
      t.string :email
      t.text :dynamic_attribs
    end
  end
end 