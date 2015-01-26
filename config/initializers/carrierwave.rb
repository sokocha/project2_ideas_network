CarrierWave.configure do |config|

  if Rails.env.development? || Rails.env.test?
    config.storage = :file
  else
    config.storage = :fog
    config.fog_credentials = {
      :provider               => 'aws',
      :aws_access_key_id      => ENV["AWS_ACCESS_KEY_ID"],
      :aws_secret_access_key  => ENV["AWS_SECRET_ACCESS_KEY"],
      :region                 => 'eu-west-1'
    }
    config.fog_directory = ENV["AWS_BUCKET_NAME_IDEAS"]
    config.fog_public  = true  # optional, defaults to true
  end
end
