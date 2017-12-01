# config/initializers/carrierwave
require 'carrierwave/orm/activerecord'
CarrierWave.configure do |config|
  config.permissions = 0666
  config.directory_permissions = 0777
  config.storage = :file
  config.enable_processing = true
end