json.extract! @product, :id, :title, :description, :image_url, :price, :orders
#json.orders @product.orders do |order|
#  json.extract! order
#end