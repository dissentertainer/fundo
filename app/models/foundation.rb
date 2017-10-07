class Foundation < ApplicationRecord
  validates :country_code, presence: true
  validates :local_currency, presence: true
  validates :postal_code, presence: true
  validates :min_starting_funds, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :min_participants, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :activation_deadline, presence: true
  validate :activation_deadline_must_be_in_future

  default_scope -> { order("created_at ASC") }

  def activation_deadline_must_be_in_future
    if activation_deadline.present? && activation_deadline < Date.today
      errors.add(:activation_date, 'must be in the future.')
    end
  end

end

