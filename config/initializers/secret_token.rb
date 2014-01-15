# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

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

NoisebridgeCanvas::Application.config.secret_key_base = secure_token

# NoisebridgeCanvas::Application.config.secret_key_base = 'a5c486f36f6570ac492fe9dabb1abcb7f23a346615ec3a8bbc84893998975a6d44b1a2612ed587eea9bb2d018bb27601977273065c8d59e53131de8d4c3467a1'
