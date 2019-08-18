require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

#credencial.ymlを読み込む変数に変更
CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory  = 'upload-teama'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AWS_ACCESS_KEY_ID',
      aws_secret_access_key: 'AWS_SECRET_ACCESS_KEY',
      region: 'ap-northeast-1'
    }
  else
    config.storage :file
    config.enable_processing = false if Rails.env.test?
  end
end
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/