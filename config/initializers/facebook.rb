facebook_config = YAML.load_file Rails.root.join 'config', 'facebook.yml'

Thegoodslife::Application.config.facebook.tap do |facebook|
  facebook.app_id = facebook_config['app_id']
  facebook.secret_key = facebook_config['secret_key']
end
