#---
# Excerpted from "Agile Web Development with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  
  fixtures :products
  
  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?, "Empty product passed validation"
    assert product.errors[:title].any?, "Missing title passed validation"
    assert product.errors[:description].any?, "Missing description passed validation"
    assert product.errors[:version].any?, "Missing Version passed validation"
    assert product.errors[:image_url].any?, "Missing image URL passed validation"
    end
  end
