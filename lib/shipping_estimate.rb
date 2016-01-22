class ShippingEstimate
  def self.for order, order_items

    # from order get destination address info
    destination = {:country => order.country, :state => order.state, :city => order.city, :postal_code => order.zip}

    # for each user/merchant, make packages
    packages = []
    order_items.group_by { |oi| oi.product.user }.each do |user, oitems|
    # user is the merchant & oitems are all order items from that merchant/user
      # from user/merchant get origin address info
      origin = {:country => user.country, :state => user.state, :city => user.city, :postal_code => user.postal_code}
      # from oitems products get all info for quantity/dimensions
      package_items = []
      oitems.each do |oi|
        oi.quantity.times do
          p_item = {:weight => oi.product.weight, :height => oi.product.height, :length => oi.product.length, :width => oi.product.width}
          package_items << p_item
        end
      end
      packages << {:origin => origin, :package_items => package_items}
    end

    # send HTTParty request to api with above info

    response = HTTParty.get('http://localhost:3000/quote',
        query: {:shipping_params => {
              :destination => destination,
              :packages => packages
            }
          })
    result = response.parsed_response
    return result #= {"UPS 3Day" => 0, "USPS 2Day" => 1}
  end
end
