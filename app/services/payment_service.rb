class PaymentService
  def initialize(foundation)
    @foundation = foundation
    @pledges = foundation.pledges
  end

  def process_monthly
    @pledges.each do |pledge|
      payment = Payment.create(foundation: pledge.foundation, pledge: pledge, amount: pledge.amount)
      @foundation.balance += payment.amount
    end
    @foundation.save
  end
end
