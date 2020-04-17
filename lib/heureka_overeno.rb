require 'net/http'
require 'json'

class HeurekaOvereno
  API_URL = 'https://api.heureka.[tld]/shop-certification/v2/order/log'

  attr_accessor :api_key, :email, :order_id, :product_item_ids, :tld

  def initialize(api_key:, email:, order_id: nil, product_item_ids: nil, tld: nil)
    @api_key = api_key
    @email = email
    @order_id = order_id
    @product_item_ids = product_item_ids || []
    @tld = tld || 'cz'
  end

  def add_product_item_id(id)
    @product_item_ids << id
  end

  def log_order
    uri = URI.parse(url)
    header = { 'Content-Type' => 'application/json' }

    data = {
      apiKey: @api_key,
      email: @email
    }
    data[:orderId] = @order_id if @order_id
    data[:productItemIds] = @product_item_ids.map(&:to_s) unless @product_item_ids.nil? || @product_item_ids.empty?

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri.request_uri, header)
    request.body = data.to_json

    res = http.request(request)
    JSON.parse(res.body)
  end

  private
    def url
      host = API_URL.sub('[tld]', @tld)
    end
end
