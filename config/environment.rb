# Load the Rails application.
require_relative "application"

Devise.secret_key = Rails.application.credentials.fetch(:secret_key_base)

# Initialize the Rails application.
Rails.application.initialize!
