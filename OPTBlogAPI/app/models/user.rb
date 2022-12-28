# frozen_string_literal: true

class User < ApplicationRecord
  include OTP::ActiveRecord
  has_secure_password
  validates :email, presence: { message: I18n.t('blank') }, uniqueness: { message: I18n.t('unique') },
                    format: { with: EMAIL_REGEX, message: I18n.t('invalid') }
  validates :password, presence: true, format: { with: PASSWORD_REGEX, message: I18n.t('pattern') }
  validates :password, confirmation: true
  validates :mobile_no, uniqueness: true
  validates :gender, presence: true
  validates :name, presence: true
end
