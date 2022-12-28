# frozen_string_literal: true

# config/initializers/otp-jwt.rb
require 'otp'
# To load the JWT related support.
require 'otp/jwt'

# Set to 'none' to disable verification at all.
# OTP::JWT::Token.jwt_algorithm = 'HS256'

# How long the token will be valid.
# OTP::JWT::Token.jwt_lifetime = 60 * 60 * 24

OTP::JWT::Token.jwt_signature_key = ENV['SECRET_KEY']
