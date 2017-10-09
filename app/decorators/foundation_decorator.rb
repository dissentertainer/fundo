class FoundationDecorator
  attr_reader :foundation

  def initialize(foundation)
    @foundation = foundation
  end

  def name
    "Community Foundation of #{foundation.locality_name} (#{foundation.postal_code})"
  end
end
