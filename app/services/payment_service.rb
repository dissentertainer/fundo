class PaymentService
  attr_reader :pledges

  def initialize(foundation)
    @foundation = foundation
    @pledges = foundation.pledges
  end

  def process_monthly
    @pledges.each do |pledge|
      payment = Payment.create(foundation: pledge.foundation, pledge: pledge, amount: pledge.amount)
    end

    buy_fake_eth(@pledges.sum(:amount))
  end

  def buy_fake_eth(dollar_amount)
    price_url = "https://api.coinmarketcap.com/v1/ticker/ethereum/"
    raw_data = HTTParty.get(price_url)
    price = raw_data.parsed_response.first["price_usd"].to_f
    purchase_amount = dollar_amount / price
    Transaction.create(type: 'EthTransaction', amount: purchase_amount, foundation: @foundation)
  end
end
