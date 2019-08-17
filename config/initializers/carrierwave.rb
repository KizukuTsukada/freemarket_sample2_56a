require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

#credencial.ymlを読み込む変数に変更
CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: 'AWS_ACCESS_KEY_ID',
    aws_secret_access_key: 'AWS_SECRET_ACCESS_KEY',
    region: 'ap-northeast-1'
  }

  config.fog_directory  = 'upload-teama'
  config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/upload-teama'
end