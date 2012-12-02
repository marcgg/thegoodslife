facebook_config = YAML.load_file(Rails.root.join('config', 'facebook.yml')) rescue {}

Thegoodslife::Application.config.facebook.tap do |facebook|
  facebook.app_id = facebook_config['app_id'] || ENV['FACEBOOK_APP_ID']
  facebook.secret_key = facebook_config['secret_key'] || ENV['FACEBOOK_SECRET_KEY']
  facebook.namespace = facebook_config['namespace'] || ENV['FACEBOOK_NAMESPACE']
end
