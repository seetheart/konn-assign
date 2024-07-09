class User < ApplicationRecord
  before_save -> { email.downcase }
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
