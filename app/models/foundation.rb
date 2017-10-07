class Foundation < ApplicationRecord
  geocoded_by :postal_code_and_country
  after_validation :geocode
  before_create :set_locality
  after_create :deploy

  validates :country_alpha2, presence: true
  validates :local_currency, presence: true
  validates :postal_code, presence: true
  validates :min_starting_funds, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :min_participants, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :activation_deadline, presence: true
  validate :activation_deadline_must_be_in_future

  default_scope -> { order("created_at ASC") }

  def postal_code_and_country
    [postal_code, country_alpha2].join(' ')
  end

  private

  def activation_deadline_must_be_in_future
    if activation_deadline.present? && activation_deadline < Date.today
      errors.add(:activation_date, 'must be in the future.')
    end
  end

  def deploy
    self.address = EthereumService.new(self).deploy_contract
  end

  def set_locality
    self.locality_name = GeocoderService.new(self.latitude, self.longitude).fetch_locality
  end
end

