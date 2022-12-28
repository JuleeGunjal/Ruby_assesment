# frozen_string_literal: true

class JsonWebToken
  def self.encode(user, payload)
    if payload.nil?
      payload = {
        user_id: user.id,
        exp: 1.hours.from_now.to_i
      }
    end
    token = JWT.encode payload, SECRET_KEY, ALGO
  end

  def self.decode(token)
    decoded_token = JWT.decode token, SECRET_KEY, true, { algorithm: ALGO }
  rescue JWT::ExpiredSignature
    puts 'error'
  end
end
