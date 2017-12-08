Paperclip::Attachment.default_options[:storage] = :s3
Paperclip::Attachment.default_options[:s3_region] = "us-east-1"
Paperclip::Attachment.default_options[:s3_protocol] = "https"
Paperclip::Attachment.default_options[:s3_credentials] = {
  bucket: "selt",
  access_key_id: "AKIAJ3B3T5ZGRZVC3GMA",
  secret_access_key: "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"
}  

Paperclip::Attachment.default_options[:url] = ":s3_domain_url"
Paperclip::Attachment.default_options[:path] = "/:class/:attachment/:id_partition/:style/:hash.:extension"

# Paperclip.options[:command_path] = 'C:\ImageMagicks'