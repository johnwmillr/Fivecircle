Aws.config.update({
  region: 'us-east-1',
  credentials: Aws::Credentials.new('AKIAJRZYZLIOZI6GAGDA', 'oAnjqGblK6fsE+NCN2n7QPJRpgQ0zfSp8ynPfpmm'),
})

S3_BUCKET = Aws::S3::Resource.new.bucket('selt')