# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
Thegoodslife::Application.config.secret_token =
  case Rails.env
  when 'production'
    ENV['SECRET_TOKEN']
  else
    'c37509890c6a96492d34f8dee73c221e4a925793bbe6506fe354b6995fd4136c6bed15ac30662d414e4af084f225fd129ef6d880f491a3220d87c329d060e105'
  end
