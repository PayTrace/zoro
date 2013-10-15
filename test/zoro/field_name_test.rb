require './test/test_helper'
require 'zoro/field_name'

describe Zoro::FieldName do 
  it "generates a good field name from a symbol" do
    Zoro::FieldName.make_field("foo_bar_one").must_equal "Foo Bar One"
    Zoro::FieldName.make_field("foo_bar_two=").must_equal "Foo Bar Two"
  end
end
