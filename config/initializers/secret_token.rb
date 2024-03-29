# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Ooshka::Application.config.secret_key_base = 'e5247156ebe9e98a35ed6536eccb305af11c055f0fdbb5de81eaa9a64b09ce6593452b1d8c11de5f7050564ec8d20cda3057fb7e282734edbbc1866f36fdfc11'

require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

Ooshka::Application.config.secret_key_base = secure_token