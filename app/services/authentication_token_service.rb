class AuthenticationTokenService
  HMAC_SECRET = 'my$ecretK3y'.freeze
  ALGORITHM_TYPE = 'HS256'.freeze

  def self.call(user_id)
    payload = { user_id: user_id }
    JWT.encode payload, HMAC_SECRET, ALGORITHM_TYPE
  end

  def self.decode(token)
    JWT.decode token, HMAC_SECRET, true, { algorithm: ALGORITHM_TYPE }
  end
end
