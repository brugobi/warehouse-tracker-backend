class AuthenticationTokenService
  HMAC_SECRET = 'my$ecretK3y'.freeze
  ALGORITHM_TYPE = 'HS256'.freeze

  def self.call
    payload = { 'test' => 'blah' }

    JWT.encode payload, HMAC_SECRET, ALGORITHM_TYPE
  end
end
