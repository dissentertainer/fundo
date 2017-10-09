class TokenService
  def initalize(foundation)
    @foundation = foundation
  end

  def distribute_initial
    if !@foundation.tokens.any?
      @foundation.pledges.each do |pledge|
        n = pledge.amount.to_i

        n.times do
          Token.create(user: pledge.user, foundation: @foundation, type: "funding")
        end
      end
    end
  end
end
