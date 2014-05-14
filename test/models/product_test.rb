require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  #fixtures :products

  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test "price must be positive" do
    product = Product.new title: 'My Book Title', description: 'yyy', image_url: 'zzz.jpg'
    product.price = -1
    assert product.invalid?
    assert_equal ['must be greater than or equal to 0.01'], product.errors[:price]

    product.price = 0
    assert product.invalid?
    assert_equal ['must be greater than or equal to 0.01'], product.errors[:price]

    product.price = 1
    assert product.valid?
  end

  test "image url" do
    ok = %w{bob.gif tom.png bobandtom.jpg http://this.and.that.com/a/b/c/picture.png}
    bad = %w{random.gyf junk.jpig http://some.url.com/a/x/s/gif.pang}

    ok.each do |name|
      product = new_product name
      assert product.valid?, "#{name} should be valid"
    end

    bad.each do |name|
      product = new_product name
      assert product.invalid?, "#{name} should be invalid"
    end


  end

  def new_product(image_url)
    Product.new title: 'My test book', description: 'yyy', price: 1, image_url: image_url
  end

  test "product is invalid without a unique title" do
    product = Product.new(title: products(:ruby).title, description: 'yyy', image_url: 'fred.jpg', price: 1)
    assert product.invalid?
    assert_equal [I18n.translate('errors.messages.taken')], product.errors[:title]
  end
end
