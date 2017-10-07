require 'redis'

Geocoder.configure(
  timeout: 10,
  lookup: :google,
  cache: Redis.new,
  always_raise: [
    Geocoder::OverQueryLimitError,
    Geocoder::RequestDenied,
    Geocoder::InvalidRequest,
    Geocoder::InvalidApiKey
  ]
)

