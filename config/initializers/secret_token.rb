# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Products::Application.config.secret_key_base = '18f7ca58793829755e657489892ed0ac03cad0fa2d5d3f41f2ad91f5e99d4379de8763b318a264e26bd7509669d16d5aa4b890142667e635fd0bcc07def86688'
