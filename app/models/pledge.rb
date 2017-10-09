class Pledge < ApplicationRecord
  attr_accessor :bank_account
  attr_accessor :bank_routing

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :currency, presence: true

  belongs_to :user, inverse_of: :pledges
  belongs_to :foundation

end
