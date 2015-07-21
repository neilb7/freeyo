require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "84a8dd6a88fdccd83dfc520c8f24f0ae909b426a9d37fd2899d3584d96de07f6"

  url_format "/media/:job/:name"

  datastore :file,
    root_path: Rails.root.join('public/system/dragonfly', Rails.env),
    server_root: Rails.root.join('public')
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
