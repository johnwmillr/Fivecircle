class Medium < ActiveRecord::Base
    belongs_to :users
    
    # This method associates the attribute ":avatar" with a file attachment
    has_attached_file :image, styles: {
        thumb: '100x100>',
        full: '300x300>'
    }
    
    # Validate the attached image is image/jpg, image/png, etc
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
